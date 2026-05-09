; DESCRIPTION: Places a black line segment connecting (144, 15) to (405, 123).
; PLAN: r0=144(x1), r1=15(y1), r2=405(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 15
LDI r2, 405
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
