; DESCRIPTION: Composite: Places a cyan dot at position (234, 17) then Draws a yellow circle centered at (133, 190) with radius 19.
; PLAN: r0=234(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=190(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 234
LDI r1, 17
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 190
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
