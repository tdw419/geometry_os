; DESCRIPTION: Composite: Sets a single white pixel at (129, 11) then Places a purple circle of radius 37 at center (359, 91) then Draws a white rectangle at (404, 128) with width 77 and height 75.
; PLAN: r0=129(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=91(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=128(y), r12=77(width), r13=75(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 91
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 128
LDI r12, 77
LDI r13, 75
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
