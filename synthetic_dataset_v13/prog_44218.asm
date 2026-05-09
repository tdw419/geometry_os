; DESCRIPTION: Composite: Places a red circle of radius 49 at center (104, 122) then Places a white dot at position (35, 138) then Renders a green box of size 64x66 starting at (397, 71).
; PLAN: r0=104(x), r1=122(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=138(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=71(y), r12=64(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 122
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 138
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 397
LDI r11, 71
LDI r12, 64
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
