; DESCRIPTION: Composite: Creates a magenta circular shape at (140, 85) with radius 38 then Places a white dot at position (453, 141) then Renders a black box of size 105x35 starting at (114, 156).
; PLAN: r0=140(x), r1=85(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=141(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=156(y), r12=105(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 85
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 141
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 114
LDI r11, 156
LDI r12, 105
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
