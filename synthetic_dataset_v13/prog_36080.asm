; DESCRIPTION: Composite: Renders a green box of size 64x57 starting at (245, 87) then Places a white circle of radius 48 at center (104, 148) then Places a green dot at position (14, 167).
; PLAN: r0=245(x), r1=87(y), r2=64(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=148(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=167(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 87
LDI r2, 64
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 148
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 167
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
