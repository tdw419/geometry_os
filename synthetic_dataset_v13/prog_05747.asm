; DESCRIPTION: Composite: Draws a yellow circle centered at (92, 166) with radius 56 then Sets a single cyan pixel at (309, 61).
; PLAN: r0=92(x), r1=166(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=61(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 166
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 61
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
