; DESCRIPTION: Composite: Renders a cyan disk with center (308, 93) and radius 75 then Draws a blue rectangle at (278, 144) with width 68 and height 37 then Sets a single orange pixel at (316, 6).
; PLAN: r0=308(x), r1=93(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=144(y), r7=68(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=6(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 93
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 144
LDI r7, 68
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 6
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
