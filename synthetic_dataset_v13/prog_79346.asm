; DESCRIPTION: Composite: Draws a magenta rectangle at (340, 106) with width 57 and height 52 then Sets a single yellow pixel at (15, 208).
; PLAN: r0=340(x), r1=106(y), r2=57(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 106
LDI r2, 57
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
