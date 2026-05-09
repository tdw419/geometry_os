; DESCRIPTION: Composite: Renders a blue disk with center (294, 204) and radius 46 then Creates a blue rectangular region at (374, 179) spanning 34 by 30 pixels.
; PLAN: r0=294(x), r1=204(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=179(y), r7=34(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 204
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 179
LDI r7, 34
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
