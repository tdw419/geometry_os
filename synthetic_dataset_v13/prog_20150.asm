; DESCRIPTION: Composite: Sets a single cyan pixel at (195, 32) then Draws a yellow circle centered at (238, 84) with radius 33.
; PLAN: r0=195(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=84(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 84
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
