; DESCRIPTION: Composite: Draws a red circle centered at (337, 138) with radius 79 then Sets a single yellow pixel at (192, 2).
; PLAN: r0=337(x), r1=138(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=2(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 138
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 2
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
