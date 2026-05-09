; DESCRIPTION: Draws a magenta line from (54, 91) to (415, 50).
; PLAN: r0=54(x1), r1=91(y1), r2=415(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 91
LDI r2, 415
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
