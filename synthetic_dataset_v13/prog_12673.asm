; DESCRIPTION: Composite: Places a green dot at position (301, 65) then Creates a blue circular shape at (167, 123) with radius 59 then Creates a yellow rectangular region at (282, 7) spanning 22 by 79 pixels.
; PLAN: r0=301(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=123(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=7(y), r12=22(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 65
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 167
LDI r6, 123
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 7
LDI r12, 22
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
