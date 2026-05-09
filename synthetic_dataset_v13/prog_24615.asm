; DESCRIPTION: Composite: Places a red dot at position (108, 110) then Renders a yellow disk with center (253, 173) and radius 56 then Creates a yellow rectangular region at (344, 158) spanning 63 by 35 pixels.
; PLAN: r0=108(x), r1=110(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=173(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=158(y), r12=63(width), r13=35(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 110
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 253
LDI r6, 173
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 158
LDI r12, 63
LDI r13, 35
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
