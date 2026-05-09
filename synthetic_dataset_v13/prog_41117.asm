; DESCRIPTION: Composite: Creates a black circular shape at (438, 194) with radius 26 then Places a magenta dot at position (157, 215).
; PLAN: r0=438(x), r1=194(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=215(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 194
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 215
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
