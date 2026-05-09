; DESCRIPTION: Composite: Creates a yellow circular shape at (404, 199) with radius 10 then Creates a white rectangular region at (393, 10) spanning 53 by 74 pixels.
; PLAN: r0=404(x), r1=199(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=10(y), r7=53(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 199
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 10
LDI r7, 53
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
