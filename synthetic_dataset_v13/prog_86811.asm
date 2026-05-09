; DESCRIPTION: Composite: Renders a yellow box of size 15x90 starting at (478, 114) then Places a white circle of radius 20 at center (290, 211) then Renders a blue line between points (348, 123) and (59, 218).
; PLAN: r0=478(x), r1=114(y), r2=15(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=211(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x1), r11=123(y1), r12=59(x2), r13=218(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 114
LDI r2, 15
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 211
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 123
LDI r12, 59
LDI r13, 218
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
