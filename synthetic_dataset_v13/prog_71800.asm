; DESCRIPTION: Composite: Renders a black line between points (193, 83) and (64, 110) then Draws a black rectangle at (369, 116) with width 63 and height 96.
; PLAN: r0=193(x1), r1=83(y1), r2=64(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=116(y), r7=63(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 83
LDI r2, 64
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 116
LDI r7, 63
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
