; DESCRIPTION: Composite: Creates a cyan circular shape at (236, 164) with radius 26 then Sets a single green pixel at (153, 67).
; PLAN: r0=236(x), r1=164(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=67(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 164
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 67
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
