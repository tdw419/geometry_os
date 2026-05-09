; DESCRIPTION: Composite: Creates a black circular shape at (463, 114) with radius 24 then Renders a white box of size 19x19 starting at (280, 7) then Places a blue dot at position (205, 60).
; PLAN: r0=463(x), r1=114(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=7(y), r7=19(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=60(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 114
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 7
LDI r7, 19
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 60
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
