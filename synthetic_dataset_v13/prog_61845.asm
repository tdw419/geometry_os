; DESCRIPTION: Places a black line segment connecting (334, 187) to (254, 138).
; PLAN: r0=334(x1), r1=187(y1), r2=254(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 187
LDI r2, 254
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
