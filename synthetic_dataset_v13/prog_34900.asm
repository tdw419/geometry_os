; DESCRIPTION: Composite: Renders a yellow box of size 105x19 starting at (319, 24) then Renders a orange disk with center (443, 121) and radius 55 then Draws a green line from (407, 59) to (129, 120).
; PLAN: r0=319(x), r1=24(y), r2=105(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=121(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x1), r11=59(y1), r12=129(x2), r13=120(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 24
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 121
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 59
LDI r12, 129
LDI r13, 120
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
