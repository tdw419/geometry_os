; DESCRIPTION: Composite: Draws a green rectangle at (196, 160) with width 81 and height 69 then Sets a single orange pixel at (410, 183).
; PLAN: r0=196(x), r1=160(y), r2=81(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=183(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 160
LDI r2, 81
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 183
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
