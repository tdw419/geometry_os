; DESCRIPTION: Composite: Creates a purple rectangular region at (166, 55) spanning 111 by 80 pixels then Renders a yellow disk with center (409, 45) and radius 16 then Places a red line segment connecting (238, 10) to (194, 248).
; PLAN: r0=166(x), r1=55(y), r2=111(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=45(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=10(y1), r12=194(x2), r13=248(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 55
LDI r2, 111
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 45
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 10
LDI r12, 194
LDI r13, 248
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
