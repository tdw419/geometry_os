; DESCRIPTION: Composite: Creates a blue rectangular region at (26, 51) spanning 81 by 100 pixels then Renders a magenta disk with center (22, 63) and radius 12.
; PLAN: r0=26(x), r1=51(y), r2=81(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x), r6=63(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 51
LDI r2, 81
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 63
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
