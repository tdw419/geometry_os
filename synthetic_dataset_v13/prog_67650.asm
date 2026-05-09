; DESCRIPTION: Composite: Renders a green disk with center (148, 192) and radius 61 then Draws a black rectangle at (171, 161) with width 96 and height 35 then Places a green dot at position (74, 181).
; PLAN: r0=148(x), r1=192(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=161(y), r7=96(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=181(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 192
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 161
LDI r7, 96
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 181
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
