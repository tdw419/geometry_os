; DESCRIPTION: Composite: Renders a purple box of size 13x117 starting at (262, 55) then Draws a white circle centered at (289, 188) with radius 67.
; PLAN: r0=262(x), r1=55(y), r2=13(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=188(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 55
LDI r2, 13
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 188
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
