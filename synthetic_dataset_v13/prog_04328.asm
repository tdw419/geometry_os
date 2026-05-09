; DESCRIPTION: Composite: Creates a orange circular shape at (260, 134) with radius 56 then Creates a green rectangular region at (406, 139) spanning 44 by 103 pixels.
; PLAN: r0=260(x), r1=134(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=139(y), r7=44(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 134
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 139
LDI r7, 44
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
