; DESCRIPTION: Composite: Renders a yellow line between points (31, 173) and (313, 147) then Draws a green rectangle at (283, 19) with width 88 and height 90.
; PLAN: r0=31(x1), r1=173(y1), r2=313(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=19(y), r7=88(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 173
LDI r2, 313
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 19
LDI r7, 88
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
