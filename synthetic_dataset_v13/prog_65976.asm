; DESCRIPTION: Composite: Places a cyan circle of radius 50 at center (167, 77) then Renders a black line between points (451, 158) and (459, 249) then Draws a black rectangle at (160, 117) with width 92 and height 66.
; PLAN: r0=167(x), r1=77(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=158(y1), r7=459(x2), r8=249(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=117(y), r12=92(width), r13=66(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 77
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 158
LDI r7, 459
LDI r8, 249
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 117
LDI r12, 92
LDI r13, 66
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
