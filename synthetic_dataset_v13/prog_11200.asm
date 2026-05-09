; DESCRIPTION: Places a yellow line segment connecting (461, 20) to (491, 220).
; PLAN: r0=461(x1), r1=20(y1), r2=491(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 20
LDI r2, 491
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
