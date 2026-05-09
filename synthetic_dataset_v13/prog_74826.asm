; DESCRIPTION: Composite: Creates a magenta rectangular region at (38, 0) spanning 44 by 112 pixels then Creates a blue circular shape at (237, 86) with radius 67.
; PLAN: r0=38(x), r1=0(y), r2=44(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=86(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 0
LDI r2, 44
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 86
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
