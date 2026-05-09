; DESCRIPTION: Composite: Renders a black line between points (97, 54) and (244, 184) then Draws a yellow rectangle at (115, 56) with width 65 and height 15.
; PLAN: r0=97(x1), r1=54(y1), r2=244(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=56(y), r7=65(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 54
LDI r2, 244
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 56
LDI r7, 65
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
