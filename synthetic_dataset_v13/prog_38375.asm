; DESCRIPTION: Places a blue line segment connecting (14, 37) to (268, 1).
; PLAN: r0=14(x1), r1=37(y1), r2=268(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 37
LDI r2, 268
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
