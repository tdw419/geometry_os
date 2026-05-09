; DESCRIPTION: Composite: Places a cyan circle of radius 28 at center (209, 194) then Sets a single orange pixel at (236, 23).
; PLAN: r0=209(x), r1=194(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 194
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
