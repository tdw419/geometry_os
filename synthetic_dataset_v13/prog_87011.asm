; DESCRIPTION: Composite: Places a black 90x75 rectangle at position (60, 130) then Places a white dot at position (291, 177) then Draws a green circle centered at (456, 137) with radius 24.
; PLAN: r0=60(x), r1=130(y), r2=90(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=177(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=137(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 130
LDI r2, 90
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 177
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 137
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
