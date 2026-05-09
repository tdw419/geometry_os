; DESCRIPTION: Composite: Places a cyan circle of radius 35 at center (96, 66) then Sets a single orange pixel at (55, 94).
; PLAN: r0=96(x), r1=66(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=94(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 66
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 94
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
