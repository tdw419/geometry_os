; DESCRIPTION: Composite: Renders a red box of size 86x33 starting at (40, 126) then Creates a white circular shape at (75, 140) with radius 48 then Places a blue dot at position (99, 183).
; PLAN: r0=40(x), r1=126(y), r2=86(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=140(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=183(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 126
LDI r2, 86
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 140
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 183
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
