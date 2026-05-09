; DESCRIPTION: Composite: Creates a orange circular shape at (151, 70) with radius 66 then Sets a single yellow pixel at (231, 132).
; PLAN: r0=151(x), r1=70(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=132(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 70
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 132
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
