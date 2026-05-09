; DESCRIPTION: Composite: Sets a single yellow pixel at (464, 57) then Draws a red circle centered at (379, 137) with radius 51 then Creates a red rectangular region at (136, 20) spanning 31 by 22 pixels.
; PLAN: r0=464(x), r1=57(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=137(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=20(y), r12=31(width), r13=22(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 57
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 379
LDI r6, 137
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 20
LDI r12, 31
LDI r13, 22
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
