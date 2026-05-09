; DESCRIPTION: Composite: Renders a blue box of size 81x113 starting at (89, 80) then Draws a orange circle centered at (124, 188) with radius 67.
; PLAN: r0=89(x), r1=80(y), r2=81(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=188(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 80
LDI r2, 81
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 188
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
