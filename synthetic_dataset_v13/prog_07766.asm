; DESCRIPTION: Composite: Draws a magenta rectangle at (70, 0) with width 43 and height 23 then Sets a single yellow pixel at (283, 143).
; PLAN: r0=70(x), r1=0(y), r2=43(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=143(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 0
LDI r2, 43
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 143
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
