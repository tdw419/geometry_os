; DESCRIPTION: Composite: Creates a cyan circular shape at (145, 185) with radius 14 then Creates a green rectangular region at (200, 214) spanning 41 by 20 pixels.
; PLAN: r0=145(x), r1=185(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=214(y), r7=41(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 185
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 214
LDI r7, 41
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
