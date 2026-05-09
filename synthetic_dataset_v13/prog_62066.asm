; DESCRIPTION: Places a blue line segment connecting (141, 9) to (268, 26).
; PLAN: r0=141(x1), r1=9(y1), r2=268(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 9
LDI r2, 268
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
