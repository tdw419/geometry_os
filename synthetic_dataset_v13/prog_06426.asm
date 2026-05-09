; DESCRIPTION: Composite: Places a yellow line segment connecting (47, 164) to (154, 45) then Draws a magenta rectangle at (348, 134) with width 86 and height 99.
; PLAN: r0=47(x1), r1=164(y1), r2=154(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=134(y), r7=86(width), r8=99(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 164
LDI r2, 154
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 134
LDI r7, 86
LDI r8, 99
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
