; DESCRIPTION: Composite: Renders a magenta box of size 67x119 starting at (162, 131) then Draws a blue circle centered at (160, 86) with radius 78.
; PLAN: r0=162(x), r1=131(y), r2=67(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=86(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 131
LDI r2, 67
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 86
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
