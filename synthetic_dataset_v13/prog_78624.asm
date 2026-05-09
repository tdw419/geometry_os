; DESCRIPTION: Composite: Renders a white box of size 87x89 starting at (272, 74) then Places a cyan dot at position (439, 172) then Places a black circle of radius 74 at center (266, 177).
; PLAN: r0=272(x), r1=74(y), r2=87(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=172(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=177(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 74
LDI r2, 87
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 172
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 177
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
