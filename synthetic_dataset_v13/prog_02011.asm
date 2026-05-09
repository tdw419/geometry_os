; DESCRIPTION: Composite: Creates a purple rectangular region at (285, 126) spanning 35 by 85 pixels then Creates a cyan circular shape at (404, 129) with radius 62.
; PLAN: r0=285(x), r1=126(y), r2=35(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=129(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 126
LDI r2, 35
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 129
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
