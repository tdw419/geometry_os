; DESCRIPTION: Composite: Places a green circle of radius 13 at center (70, 74) then Draws a black rectangle at (195, 117) with width 66 and height 106 then Places a orange dot at position (246, 68).
; PLAN: r0=70(x), r1=74(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=117(y), r7=66(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x), r11=68(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 74
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 117
LDI r7, 66
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 68
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
