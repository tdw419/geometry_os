; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 47) then Renders a yellow disk with center (369, 72) and radius 59 then Creates a yellow rectangular region at (416, 113) spanning 62 by 109 pixels.
; PLAN: r0=270(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=72(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x), r11=113(y), r12=62(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 369
LDI r6, 72
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 113
LDI r12, 62
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
