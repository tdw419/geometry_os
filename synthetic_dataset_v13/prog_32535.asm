; DESCRIPTION: Composite: Sets a single orange pixel at (176, 216) then Places a black line segment connecting (351, 17) to (58, 209).
; PLAN: r0=176(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=351(x1), r6=17(y1), r7=58(x2), r8=209(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 351
LDI r6, 17
LDI r7, 58
LDI r8, 209
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
