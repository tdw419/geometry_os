; DESCRIPTION: Composite: Draws a orange rectangle at (104, 135) with width 100 and height 27 then Draws a magenta circle centered at (413, 169) with radius 79.
; PLAN: r0=104(x), r1=135(y), r2=100(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=169(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 135
LDI r2, 100
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 169
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
