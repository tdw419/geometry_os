; DESCRIPTION: Composite: Renders a cyan disk with center (134, 151) and radius 58 then Draws a yellow rectangle at (331, 7) with width 35 and height 109 then Places a cyan line segment connecting (353, 233) to (370, 77).
; PLAN: r0=134(x), r1=151(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x), r6=7(y), r7=35(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x1), r11=233(y1), r12=370(x2), r13=77(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 151
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 7
LDI r7, 35
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 233
LDI r12, 370
LDI r13, 77
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
