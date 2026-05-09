; DESCRIPTION: Composite: Renders a purple box of size 45x65 starting at (158, 166) then Draws a blue circle centered at (117, 151) with radius 69.
; PLAN: r0=158(x), r1=166(y), r2=45(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=151(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 166
LDI r2, 45
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 151
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
