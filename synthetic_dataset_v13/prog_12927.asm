; DESCRIPTION: Composite: Draws a blue rectangle at (283, 90) with width 81 and height 113 then Sets a single orange pixel at (3, 129).
; PLAN: r0=283(x), r1=90(y), r2=81(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=129(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 90
LDI r2, 81
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 129
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
