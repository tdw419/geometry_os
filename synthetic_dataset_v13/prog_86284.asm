; DESCRIPTION: Places a yellow line segment connecting (35, 14) to (430, 240).
; PLAN: r0=35(x1), r1=14(y1), r2=430(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 14
LDI r2, 430
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
