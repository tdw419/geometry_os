; DESCRIPTION: Composite: Sets a single orange pixel at (287, 219) then Places a white line segment connecting (323, 15) to (491, 128).
; PLAN: r0=287(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=15(y1), r7=491(x2), r8=128(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 15
LDI r7, 491
LDI r8, 128
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
