; DESCRIPTION: Composite: Places a purple line segment connecting (370, 191) to (408, 141) then Places a black dot at position (417, 184).
; PLAN: r0=370(x1), r1=191(y1), r2=408(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=184(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 191
LDI r2, 408
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 184
LDI r7, 0x000000
PSET r5, r6, r7
HALT
