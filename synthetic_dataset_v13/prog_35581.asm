; DESCRIPTION: Composite: Renders a white disk with center (372, 73) and radius 20 then Creates a black rectangular region at (389, 19) spanning 77 by 85 pixels.
; PLAN: r0=372(x), r1=73(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=19(y), r7=77(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 73
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 19
LDI r7, 77
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
