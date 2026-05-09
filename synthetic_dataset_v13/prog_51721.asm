; DESCRIPTION: Composite: Draws a red rectangle at (287, 196) with width 82 and height 11 then Draws a red circle centered at (172, 55) with radius 10 then Renders a cyan line between points (371, 196) and (306, 175).
; PLAN: r0=287(x), r1=196(y), r2=82(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=55(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x1), r11=196(y1), r12=306(x2), r13=175(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 196
LDI r2, 82
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 55
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 196
LDI r12, 306
LDI r13, 175
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
