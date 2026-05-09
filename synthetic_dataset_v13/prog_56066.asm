; DESCRIPTION: Composite: Draws a orange rectangle at (241, 50) with width 73 and height 109 then Renders a orange line between points (203, 210) and (480, 137).
; PLAN: r0=241(x), r1=50(y), r2=73(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=210(y1), r7=480(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 50
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 210
LDI r7, 480
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
