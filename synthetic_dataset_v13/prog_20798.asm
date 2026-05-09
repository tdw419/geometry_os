; DESCRIPTION: Composite: Places a green line segment connecting (101, 230) to (136, 159) then Renders a magenta box of size 76x32 starting at (67, 103) then Draws a yellow circle centered at (257, 81) with radius 71.
; PLAN: r0=101(x1), r1=230(y1), r2=136(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=103(y), r7=76(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=81(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 230
LDI r2, 136
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 103
LDI r7, 76
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 81
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
