; DESCRIPTION: Composite: Places a black circle of radius 19 at center (106, 92) then Sets a single orange pixel at (352, 242).
; PLAN: r0=106(x), r1=92(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 92
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
