; DESCRIPTION: Composite: Creates a green circular shape at (98, 162) with radius 45 then Places a cyan line segment connecting (446, 83) to (351, 102) then Sets a single orange pixel at (203, 126).
; PLAN: r0=98(x), r1=162(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=83(y1), r7=351(x2), r8=102(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=126(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 162
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 83
LDI r7, 351
LDI r8, 102
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 126
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
