; DESCRIPTION: Composite: Draws a orange rectangle at (364, 22) with width 67 and height 88 then Renders a purple line between points (137, 35) and (269, 51).
; PLAN: r0=364(x), r1=22(y), r2=67(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=35(y1), r7=269(x2), r8=51(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 22
LDI r2, 67
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 35
LDI r7, 269
LDI r8, 51
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
