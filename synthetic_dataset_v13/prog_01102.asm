; DESCRIPTION: Composite: Places a white 48x36 rectangle at position (25, 148) then Places a red dot at position (329, 185) then Renders a black disk with center (256, 103) and radius 78.
; PLAN: r0=25(x), r1=148(y), r2=48(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=185(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=103(y), r12=78(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 148
LDI r2, 48
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 185
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 256
LDI r11, 103
LDI r12, 78
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
