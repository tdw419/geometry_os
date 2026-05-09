; DESCRIPTION: Composite: Renders a yellow disk with center (421, 95) and radius 57 then Renders a green box of size 69x114 starting at (194, 84) then Renders a blue line between points (427, 210) and (380, 192).
; PLAN: r0=421(x), r1=95(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=84(y), r7=69(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x1), r11=210(y1), r12=380(x2), r13=192(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 95
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 84
LDI r7, 69
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 210
LDI r12, 380
LDI r13, 192
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
