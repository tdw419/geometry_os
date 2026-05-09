; DESCRIPTION: Composite: Creates a cyan circular shape at (74, 66) with radius 51 then Sets a single green pixel at (181, 133).
; PLAN: r0=74(x), r1=66(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=133(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 74
LDI r1, 66
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 133
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
