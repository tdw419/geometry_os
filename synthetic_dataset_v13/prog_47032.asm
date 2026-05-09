; DESCRIPTION: Composite: Places a black circle of radius 12 at center (104, 76) then Creates a green rectangular region at (69, 84) spanning 56 by 111 pixels.
; PLAN: r0=104(x), r1=76(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=84(y), r7=56(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 76
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 84
LDI r7, 56
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
