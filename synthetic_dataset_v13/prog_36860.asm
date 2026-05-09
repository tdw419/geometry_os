; DESCRIPTION: Places a black line segment connecting (494, 215) to (351, 229).
; PLAN: r0=494(x1), r1=215(y1), r2=351(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 215
LDI r2, 351
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
