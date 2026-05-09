; DESCRIPTION: Composite: Draws a black rectangle at (388, 90) with width 86 and height 99 then Renders a orange line between points (281, 222) and (38, 254).
; PLAN: r0=388(x), r1=90(y), r2=86(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=222(y1), r7=38(x2), r8=254(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 90
LDI r2, 86
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 222
LDI r7, 38
LDI r8, 254
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
