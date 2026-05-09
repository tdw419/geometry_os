; DESCRIPTION: Composite: Draws a orange circle centered at (335, 101) with radius 36 then Draws a white rectangle at (24, 119) with width 63 and height 112.
; PLAN: r0=335(x), r1=101(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=119(y), r7=63(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 101
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 119
LDI r7, 63
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
