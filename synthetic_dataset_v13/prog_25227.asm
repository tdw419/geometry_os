; DESCRIPTION: Composite: Creates a green circular shape at (77, 98) with radius 55 then Creates a magenta rectangular region at (393, 91) spanning 101 by 24 pixels.
; PLAN: r0=77(x), r1=98(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=91(y), r7=101(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 98
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 91
LDI r7, 101
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
