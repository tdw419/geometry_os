; DESCRIPTION: Places a yellow line segment connecting (278, 21) to (321, 216).
; PLAN: r0=278(x1), r1=21(y1), r2=321(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 21
LDI r2, 321
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
