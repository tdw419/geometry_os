; DESCRIPTION: Draws a magenta line from (57, 16) to (183, 3).
; PLAN: r0=57(x1), r1=16(y1), r2=183(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 16
LDI r2, 183
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
