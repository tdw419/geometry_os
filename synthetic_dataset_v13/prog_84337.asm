; DESCRIPTION: Places a black line segment connecting (292, 155) to (23, 195).
; PLAN: r0=292(x1), r1=155(y1), r2=23(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 155
LDI r2, 23
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
