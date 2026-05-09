; DESCRIPTION: Composite: Draws a yellow rectangle at (194, 27) with width 62 and height 52 then Places a black circle of radius 42 at center (184, 73) then Renders a blue line between points (495, 139) and (309, 130).
; PLAN: r0=194(x), r1=27(y), r2=62(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=73(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x1), r11=139(y1), r12=309(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 27
LDI r2, 62
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 73
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 139
LDI r12, 309
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
