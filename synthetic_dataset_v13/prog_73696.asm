; DESCRIPTION: Composite: Creates a green rectangular region at (360, 231) spanning 11 by 12 pixels then Renders a purple disk with center (264, 145) and radius 77 then Places a yellow line segment connecting (377, 171) to (412, 141).
; PLAN: r0=360(x), r1=231(y), r2=11(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=145(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x1), r11=171(y1), r12=412(x2), r13=141(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 231
LDI r2, 11
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 145
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 171
LDI r12, 412
LDI r13, 141
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
