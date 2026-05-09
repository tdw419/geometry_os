; DESCRIPTION: Composite: Renders a blue line between points (349, 149) and (144, 111) then Renders a green box of size 59x38 starting at (368, 46) then Renders a white disk with center (133, 45) and radius 38.
; PLAN: r0=349(x1), r1=149(y1), r2=144(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=46(y), r7=59(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=45(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 149
LDI r2, 144
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 46
LDI r7, 59
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 45
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
