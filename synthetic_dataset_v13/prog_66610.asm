; DESCRIPTION: Composite: Renders a magenta disk with center (212, 116) and radius 72 then Draws a black rectangle at (170, 8) with width 22 and height 99.
; PLAN: r0=212(x), r1=116(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=8(y), r7=22(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 116
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 8
LDI r7, 22
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
