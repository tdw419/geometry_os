; DESCRIPTION: Composite: Creates a orange circular shape at (151, 142) with radius 23 then Places a white dot at position (406, 88) then Renders a blue box of size 20x16 starting at (209, 238).
; PLAN: r0=151(x), r1=142(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=88(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=238(y), r12=20(width), r13=16(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 142
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 88
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 209
LDI r11, 238
LDI r12, 20
LDI r13, 16
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
