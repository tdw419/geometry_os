; DESCRIPTION: Composite: Renders a black line between points (118, 15) and (286, 123) then Draws a yellow rectangle at (294, 88) with width 70 and height 46.
; PLAN: r0=118(x1), r1=15(y1), r2=286(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=88(y), r7=70(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 15
LDI r2, 286
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 88
LDI r7, 70
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
