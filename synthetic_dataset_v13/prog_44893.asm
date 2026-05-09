; DESCRIPTION: Composite: Renders a black disk with center (404, 100) and radius 75 then Creates a white rectangular region at (48, 49) spanning 56 by 35 pixels.
; PLAN: r0=404(x), r1=100(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=49(y), r7=56(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 100
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 49
LDI r7, 56
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
