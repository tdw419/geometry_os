; DESCRIPTION: Places a blue line segment connecting (9, 7) to (467, 149).
; PLAN: r0=9(x1), r1=7(y1), r2=467(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 7
LDI r2, 467
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
