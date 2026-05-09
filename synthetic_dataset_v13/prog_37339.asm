; DESCRIPTION: Composite: Renders a yellow box of size 103x119 starting at (233, 129) then Places a green dot at position (257, 35) then Creates a white circular shape at (182, 67) with radius 59.
; PLAN: r0=233(x), r1=129(y), r2=103(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=35(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=67(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 129
LDI r2, 103
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 35
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 182
LDI r11, 67
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
