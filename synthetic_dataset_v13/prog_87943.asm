; DESCRIPTION: Composite: Renders a magenta box of size 81x40 starting at (91, 191) then Draws a purple circle centered at (116, 173) with radius 68.
; PLAN: r0=91(x), r1=191(y), r2=81(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=173(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 191
LDI r2, 81
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 173
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
