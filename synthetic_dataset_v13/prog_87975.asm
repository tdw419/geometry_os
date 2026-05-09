; DESCRIPTION: Composite: Draws a green circle centered at (449, 117) with radius 59 then Sets a single green pixel at (113, 217).
; PLAN: r0=449(x), r1=117(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=217(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 117
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 217
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
