; DESCRIPTION: Composite: Places a purple dot at position (427, 9) then Places a cyan 95x78 rectangle at position (158, 157) then Renders a white disk with center (208, 183) and radius 13.
; PLAN: r0=427(x), r1=9(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=157(y), r7=95(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=183(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 9
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 158
LDI r6, 157
LDI r7, 95
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 183
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
