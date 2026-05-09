; DESCRIPTION: Composite: Creates a magenta circular shape at (375, 167) with radius 68 then Renders a white box of size 41x10 starting at (456, 97) then Places a purple dot at position (156, 249).
; PLAN: r0=375(x), r1=167(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=97(y), r7=41(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=249(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 167
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 97
LDI r7, 41
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 249
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
