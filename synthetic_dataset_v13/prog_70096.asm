; DESCRIPTION: Composite: Places a blue circle of radius 34 at center (195, 127) then Draws a black rectangle at (6, 192) with width 60 and height 56 then Places a white dot at position (126, 71).
; PLAN: r0=195(x), r1=127(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=192(y), r7=60(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=71(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 127
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 192
LDI r7, 60
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 71
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
