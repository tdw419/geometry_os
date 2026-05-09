; DESCRIPTION: Composite: Renders a purple box of size 84x62 starting at (169, 112) then Sets a single orange pixel at (494, 105).
; PLAN: r0=169(x), r1=112(y), r2=84(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=105(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 112
LDI r2, 84
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 105
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
