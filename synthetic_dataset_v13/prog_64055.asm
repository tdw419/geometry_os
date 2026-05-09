; DESCRIPTION: Composite: Draws a white circle centered at (280, 135) with radius 67 then Places a blue dot at position (474, 111).
; PLAN: r0=280(x), r1=135(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=111(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 135
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 111
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
