; DESCRIPTION: Composite: Renders a magenta box of size 96x13 starting at (236, 230) then Sets a single magenta pixel at (451, 52).
; PLAN: r0=236(x), r1=230(y), r2=96(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=52(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 230
LDI r2, 96
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 52
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
