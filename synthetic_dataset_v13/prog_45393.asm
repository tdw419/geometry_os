; DESCRIPTION: Composite: Draws a magenta rectangle at (270, 89) with width 12 and height 76 then Sets a single cyan pixel at (285, 43).
; PLAN: r0=270(x), r1=89(y), r2=12(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=43(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 89
LDI r2, 12
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 43
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
