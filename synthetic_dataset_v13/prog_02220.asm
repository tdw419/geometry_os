; DESCRIPTION: Composite: Draws a orange rectangle at (379, 22) with width 31 and height 20 then Sets a single purple pixel at (245, 94).
; PLAN: r0=379(x), r1=22(y), r2=31(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=94(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 22
LDI r2, 31
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 94
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
