; DESCRIPTION: Composite: Places a red dot at position (369, 9) then Draws a red circle centered at (191, 69) with radius 31 then Creates a magenta rectangular region at (280, 172) spanning 17 by 51 pixels.
; PLAN: r0=369(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=69(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=172(y), r12=17(width), r13=51(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 191
LDI r6, 69
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 172
LDI r12, 17
LDI r13, 51
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
