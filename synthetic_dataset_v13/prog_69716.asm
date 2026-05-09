; DESCRIPTION: Composite: Sets a single blue pixel at (279, 219) then Draws a red circle centered at (118, 45) with radius 13 then Draws a orange rectangle at (289, 100) with width 22 and height 30.
; PLAN: r0=279(x), r1=219(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=45(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=100(y), r12=22(width), r13=30(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 219
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 45
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 100
LDI r12, 22
LDI r13, 30
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
