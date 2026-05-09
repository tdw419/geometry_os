; DESCRIPTION: Composite: Creates a yellow circular shape at (404, 157) with radius 25 then Creates a green rectangular region at (380, 113) spanning 14 by 25 pixels.
; PLAN: r0=404(x), r1=157(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=113(y), r7=14(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 157
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 113
LDI r7, 14
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
