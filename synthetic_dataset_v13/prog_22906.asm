; DESCRIPTION: Composite: Creates a blue rectangular region at (3, 22) spanning 76 by 93 pixels then Renders a orange disk with center (467, 196) and radius 19.
; PLAN: r0=3(x), r1=22(y), r2=76(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=196(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 22
LDI r2, 76
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 196
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
