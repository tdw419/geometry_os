; DESCRIPTION: Places a black line segment connecting (258, 108) to (80, 74).
; PLAN: r0=258(x1), r1=108(y1), r2=80(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 108
LDI r2, 80
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
