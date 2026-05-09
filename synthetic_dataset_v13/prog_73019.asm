; DESCRIPTION: Composite: Draws a white rectangle at (434, 72) with width 68 and height 19 then Sets a single orange pixel at (222, 188).
; PLAN: r0=434(x), r1=72(y), r2=68(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=188(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 72
LDI r2, 68
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 188
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
