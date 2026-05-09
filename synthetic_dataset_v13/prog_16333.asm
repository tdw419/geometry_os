; DESCRIPTION: Composite: Sets a single red pixel at (381, 178) then Draws a red circle centered at (378, 100) with radius 76 then Places a blue 33x48 rectangle at position (293, 183).
; PLAN: r0=381(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=100(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=183(y), r12=33(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 378
LDI r6, 100
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 183
LDI r12, 33
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
