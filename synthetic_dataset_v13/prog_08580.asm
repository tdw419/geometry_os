; DESCRIPTION: Places a black line segment connecting (175, 160) to (452, 39).
; PLAN: r0=175(x1), r1=160(y1), r2=452(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 160
LDI r2, 452
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
