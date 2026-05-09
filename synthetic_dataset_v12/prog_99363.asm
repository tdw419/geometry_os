; DESCRIPTION: Composite: Creates a yellow circular shape at (202, 137) with radius 37 then Places a white dot at position (412, 194).
; PLAN: r0=202(x), r1=137(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 202
LDI r1, 137
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
