; DESCRIPTION: Draws a magenta line from (415, 146) to (457, 9).
; PLAN: r0=415(x1), r1=146(y1), r2=457(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 146
LDI r2, 457
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
