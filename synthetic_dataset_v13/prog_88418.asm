; DESCRIPTION: Composite: Draws a black circle centered at (106, 138) with radius 75 then Sets a single cyan pixel at (382, 70).
; PLAN: r0=106(x), r1=138(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=70(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 138
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 70
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
