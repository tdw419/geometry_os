; DESCRIPTION: Composite: Draws a magenta rectangle at (34, 110) with width 82 and height 88 then Sets a single green pixel at (49, 116).
; PLAN: r0=34(x), r1=110(y), r2=82(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=116(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 110
LDI r2, 82
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 116
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
