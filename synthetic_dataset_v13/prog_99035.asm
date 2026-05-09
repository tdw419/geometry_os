; DESCRIPTION: Composite: Creates a green circular shape at (309, 106) with radius 77 then Creates a red rectangular region at (293, 156) spanning 17 by 13 pixels.
; PLAN: r0=309(x), r1=106(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=156(y), r7=17(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 106
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 156
LDI r7, 17
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
