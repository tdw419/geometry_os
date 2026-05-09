; DESCRIPTION: Places a black line segment connecting (240, 17) to (432, 234).
; PLAN: r0=240(x1), r1=17(y1), r2=432(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 432
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
