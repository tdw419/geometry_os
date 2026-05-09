; DESCRIPTION: Composite: Sets a single blue pixel at (82, 30) then Draws a red circle centered at (273, 31) with radius 25 then Draws a orange rectangle at (9, 45) with width 19 and height 86.
; PLAN: r0=82(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=31(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=9(x), r11=45(y), r12=19(width), r13=86(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 31
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 9
LDI r11, 45
LDI r12, 19
LDI r13, 86
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
