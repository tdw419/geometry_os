; DESCRIPTION: Composite: Renders a white box of size 76x25 starting at (396, 79) then Creates a blue circular shape at (106, 87) with radius 79.
; PLAN: r0=396(x), r1=79(y), r2=76(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=87(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 79
LDI r2, 76
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 87
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
