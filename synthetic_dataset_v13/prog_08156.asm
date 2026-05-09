; DESCRIPTION: Composite: Creates a green circular shape at (247, 178) with radius 44 then Sets a single yellow pixel at (101, 231).
; PLAN: r0=247(x), r1=178(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=231(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 178
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 231
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
