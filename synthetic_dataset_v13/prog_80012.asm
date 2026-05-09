; DESCRIPTION: Composite: Places a orange line segment connecting (426, 57) to (238, 103) then Renders a black disk with center (254, 119) and radius 35 then Creates a blue rectangular region at (92, 12) spanning 46 by 82 pixels.
; PLAN: r0=426(x1), r1=57(y1), r2=238(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=119(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=12(y), r12=46(width), r13=82(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 57
LDI r2, 238
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 119
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 12
LDI r12, 46
LDI r13, 82
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
