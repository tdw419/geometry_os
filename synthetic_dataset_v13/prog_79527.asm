; DESCRIPTION: Places a black line segment connecting (125, 253) to (339, 244).
; PLAN: r0=125(x1), r1=253(y1), r2=339(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 253
LDI r2, 339
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
