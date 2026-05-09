; DESCRIPTION: Composite: Draws a blue rectangle at (239, 68) with width 89 and height 27 then Sets a single yellow pixel at (299, 245).
; PLAN: r0=239(x), r1=68(y), r2=89(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=245(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 68
LDI r2, 89
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 245
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
