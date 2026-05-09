; DESCRIPTION: Composite: Renders a black disk with center (191, 166) and radius 66 then Renders a green line between points (288, 138) and (139, 52) then Creates a black rectangular region at (388, 52) spanning 91 by 111 pixels.
; PLAN: r0=191(x), r1=166(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=138(y1), r7=139(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=388(x), r11=52(y), r12=91(width), r13=111(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 166
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 138
LDI r7, 139
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 52
LDI r12, 91
LDI r13, 111
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
