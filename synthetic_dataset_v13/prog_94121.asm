; DESCRIPTION: Composite: Draws a red rectangle at (116, 167) with width 68 and height 79 then Renders a green disk with center (248, 126) and radius 35.
; PLAN: r0=116(x), r1=167(y), r2=68(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=126(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 167
LDI r2, 68
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 126
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
