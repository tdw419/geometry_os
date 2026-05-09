; DESCRIPTION: Draws a magenta line from (119, 4) to (30, 62).
; PLAN: r0=119(x1), r1=4(y1), r2=30(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 4
LDI r2, 30
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
