; DESCRIPTION: Places a black line segment connecting (406, 14) to (17, 86).
; PLAN: r0=406(x1), r1=14(y1), r2=17(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 14
LDI r2, 17
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
