; DESCRIPTION: Composite: Renders a black disk with center (402, 79) and radius 28 then Places a blue dot at position (181, 126) then Draws a orange rectangle at (42, 47) with width 54 and height 94.
; PLAN: r0=402(x), r1=79(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=126(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=42(x), r11=47(y), r12=54(width), r13=94(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 79
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 126
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 42
LDI r11, 47
LDI r12, 54
LDI r13, 94
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
