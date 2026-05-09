; DESCRIPTION: Composite: Creates a white rectangular region at (289, 33) spanning 92 by 99 pixels then Places a green circle of radius 72 at center (72, 78) then Renders a orange line between points (131, 112) and (111, 56).
; PLAN: r0=289(x), r1=33(y), r2=92(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=78(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x1), r11=112(y1), r12=111(x2), r13=56(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 33
LDI r2, 92
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 78
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 112
LDI r12, 111
LDI r13, 56
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
