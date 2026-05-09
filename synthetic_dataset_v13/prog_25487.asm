; DESCRIPTION: Composite: Renders a yellow disk with center (171, 47) and radius 47 then Renders a blue line between points (448, 105) and (478, 153) then Renders a blue box of size 60x59 starting at (407, 127).
; PLAN: r0=171(x), r1=47(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x1), r6=105(y1), r7=478(x2), r8=153(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=127(y), r12=60(width), r13=59(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 47
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 105
LDI r7, 478
LDI r8, 153
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 127
LDI r12, 60
LDI r13, 59
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
