; DESCRIPTION: Composite: Draws a orange rectangle at (80, 153) with width 90 and height 96 then Places a red line segment connecting (203, 88) to (245, 18).
; PLAN: r0=80(x), r1=153(y), r2=90(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=88(y1), r7=245(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 153
LDI r2, 90
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 88
LDI r7, 245
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
