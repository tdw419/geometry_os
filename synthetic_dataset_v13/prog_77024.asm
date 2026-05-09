; DESCRIPTION: Composite: Renders a orange disk with center (201, 180) and radius 54 then Creates a blue rectangular region at (76, 67) spanning 43 by 34 pixels.
; PLAN: r0=201(x), r1=180(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=67(y), r7=43(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 180
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 67
LDI r7, 43
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
