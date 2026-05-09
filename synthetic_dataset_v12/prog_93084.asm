; DESCRIPTION: Composite: Places a cyan circle of radius 63 at center (193, 137) then Sets a single orange pixel at (457, 61).
; PLAN: r0=193(x), r1=137(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=61(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 193
LDI r1, 137
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 61
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
