; DESCRIPTION: Places a black line segment connecting (48, 249) to (311, 122).
; PLAN: r0=48(x1), r1=249(y1), r2=311(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 249
LDI r2, 311
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
