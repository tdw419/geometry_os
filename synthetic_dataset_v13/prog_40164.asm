; DESCRIPTION: Composite: Creates a white circular shape at (359, 98) with radius 20 then Renders a black box of size 71x40 starting at (157, 183) then Places a green dot at position (358, 73).
; PLAN: r0=359(x), r1=98(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=183(y), r7=71(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=73(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 98
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 183
LDI r7, 71
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 73
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
