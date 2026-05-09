; DESCRIPTION: Composite: Sets a single magenta pixel at (400, 128) then Creates a green circular shape at (355, 191) with radius 58 then Draws a blue rectangle at (83, 8) with width 13 and height 61.
; PLAN: r0=400(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=191(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x), r11=8(y), r12=13(width), r13=61(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 191
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 8
LDI r12, 13
LDI r13, 61
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
