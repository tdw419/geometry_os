; DESCRIPTION: Composite: Sets a single magenta pixel at (210, 33) then Draws a green circle centered at (376, 165) with radius 79 then Draws a orange rectangle at (3, 201) with width 29 and height 32.
; PLAN: r0=210(x), r1=33(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=165(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x), r11=201(y), r12=29(width), r13=32(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 33
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 165
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 201
LDI r12, 29
LDI r13, 32
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
