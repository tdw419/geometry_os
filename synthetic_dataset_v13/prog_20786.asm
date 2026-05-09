; DESCRIPTION: Places a black line segment connecting (446, 2) to (123, 147).
; PLAN: r0=446(x1), r1=2(y1), r2=123(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 2
LDI r2, 123
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
