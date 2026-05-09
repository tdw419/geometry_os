; DESCRIPTION: Composite: Draws a green rectangle at (17, 22) with width 102 and height 87 then Sets a single cyan pixel at (257, 240).
; PLAN: r0=17(x), r1=22(y), r2=102(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=240(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 22
LDI r2, 102
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 240
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
