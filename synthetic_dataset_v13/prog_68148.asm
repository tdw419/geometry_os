; DESCRIPTION: Composite: Renders a blue box of size 71x63 starting at (138, 2) then Creates a yellow circular shape at (244, 125) with radius 30.
; PLAN: r0=138(x), r1=2(y), r2=71(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=125(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 2
LDI r2, 71
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 125
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
