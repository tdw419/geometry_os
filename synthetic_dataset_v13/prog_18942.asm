; DESCRIPTION: Places a black line segment connecting (107, 163) to (3, 237).
; PLAN: r0=107(x1), r1=163(y1), r2=3(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 163
LDI r2, 3
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
