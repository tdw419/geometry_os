; DESCRIPTION: Places a black line segment connecting (377, 11) to (261, 162).
; PLAN: r0=377(x1), r1=11(y1), r2=261(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 11
LDI r2, 261
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
