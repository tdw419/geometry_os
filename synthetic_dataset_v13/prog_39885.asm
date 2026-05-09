; DESCRIPTION: Composite: Creates a orange circular shape at (107, 34) with radius 16 then Sets a single cyan pixel at (141, 85).
; PLAN: r0=107(x), r1=34(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 34
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
