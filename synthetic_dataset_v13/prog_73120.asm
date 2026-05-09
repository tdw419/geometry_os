; DESCRIPTION: Composite: Places a orange line segment connecting (385, 222) to (265, 96) then Draws a red rectangle at (14, 37) with width 111 and height 73.
; PLAN: r0=385(x1), r1=222(y1), r2=265(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=37(y), r7=111(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 222
LDI r2, 265
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 37
LDI r7, 111
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
