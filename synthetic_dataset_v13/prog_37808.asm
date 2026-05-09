; DESCRIPTION: Composite: Draws a yellow rectangle at (301, 74) with width 38 and height 61 then Sets a single yellow pixel at (347, 64).
; PLAN: r0=301(x), r1=74(y), r2=38(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=64(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 74
LDI r2, 38
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 64
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
