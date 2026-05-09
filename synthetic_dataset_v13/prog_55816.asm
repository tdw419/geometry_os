; DESCRIPTION: Composite: Draws a magenta circle centered at (404, 125) with radius 21 then Places a purple dot at position (414, 162) then Draws a green rectangle at (220, 24) with width 22 and height 24.
; PLAN: r0=404(x), r1=125(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=162(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=24(y), r12=22(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 125
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 162
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 24
LDI r12, 22
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
