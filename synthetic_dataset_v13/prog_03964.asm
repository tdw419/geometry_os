; DESCRIPTION: Composite: Places a white 109x106 rectangle at position (39, 109) then Places a blue dot at position (209, 80) then Draws a magenta circle centered at (118, 123) with radius 20.
; PLAN: r0=39(x), r1=109(y), r2=109(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=80(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=123(y), r12=20(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 109
LDI r2, 109
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 80
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 118
LDI r11, 123
LDI r12, 20
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
