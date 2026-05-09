; DESCRIPTION: Composite: Renders a magenta box of size 11x58 starting at (62, 134) then Sets a single purple pixel at (241, 132).
; PLAN: r0=62(x), r1=134(y), r2=11(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=132(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 134
LDI r2, 11
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 132
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
