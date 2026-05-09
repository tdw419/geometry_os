; DESCRIPTION: Places a black line segment connecting (329, 241) to (254, 100).
; PLAN: r0=329(x1), r1=241(y1), r2=254(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 241
LDI r2, 254
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
