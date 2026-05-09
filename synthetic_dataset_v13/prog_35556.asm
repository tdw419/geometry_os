; DESCRIPTION: Composite: Creates a green rectangular region at (258, 57) spanning 54 by 24 pixels then Places a cyan circle of radius 17 at center (348, 91).
; PLAN: r0=258(x), r1=57(y), r2=54(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=91(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 57
LDI r2, 54
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 91
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
