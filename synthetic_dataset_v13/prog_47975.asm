; DESCRIPTION: Composite: Sets a single magenta pixel at (496, 10) then Draws a cyan circle centered at (408, 166) with radius 25 then Creates a orange rectangular region at (123, 169) spanning 52 by 13 pixels.
; PLAN: r0=496(x), r1=10(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=166(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=169(y), r12=52(width), r13=13(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 10
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 166
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 169
LDI r12, 52
LDI r13, 13
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
