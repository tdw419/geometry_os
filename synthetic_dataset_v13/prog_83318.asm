; DESCRIPTION: Composite: Draws a green rectangle at (216, 137) with width 91 and height 51 then Sets a single magenta pixel at (200, 156).
; PLAN: r0=216(x), r1=137(y), r2=91(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 137
LDI r2, 91
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
