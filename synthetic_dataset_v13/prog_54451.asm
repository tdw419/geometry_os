; DESCRIPTION: Composite: Renders a green disk with center (180, 201) and radius 45 then Creates a black rectangular region at (457, 47) spanning 12 by 112 pixels.
; PLAN: r0=180(x), r1=201(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=47(y), r7=12(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 201
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 47
LDI r7, 12
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
