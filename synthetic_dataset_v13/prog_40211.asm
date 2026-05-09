; DESCRIPTION: Composite: Creates a black rectangular region at (230, 59) spanning 38 by 118 pixels then Renders a cyan line between points (422, 167) and (187, 19) then Renders a blue disk with center (249, 112) and radius 55.
; PLAN: r0=230(x), r1=59(y), r2=38(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=167(y1), r7=187(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=112(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 59
LDI r2, 38
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 167
LDI r7, 187
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 112
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
