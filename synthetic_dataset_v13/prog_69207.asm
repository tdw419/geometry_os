; DESCRIPTION: Composite: Places a cyan circle of radius 80 at center (324, 98) then Sets a single cyan pixel at (397, 221).
; PLAN: r0=324(x), r1=98(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=221(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 98
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 221
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
