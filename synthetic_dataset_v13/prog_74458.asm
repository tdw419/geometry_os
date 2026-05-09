; DESCRIPTION: Composite: Renders a blue line between points (28, 172) and (505, 160) then Draws a red rectangle at (236, 81) with width 14 and height 59.
; PLAN: r0=28(x1), r1=172(y1), r2=505(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=81(y), r7=14(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 172
LDI r2, 505
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 81
LDI r7, 14
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
