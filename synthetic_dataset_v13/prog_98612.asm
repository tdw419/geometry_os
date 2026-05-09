; DESCRIPTION: Composite: Creates a green circular shape at (197, 157) with radius 60 then Places a yellow dot at position (336, 247).
; PLAN: r0=197(x), r1=157(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=247(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 197
LDI r1, 157
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 247
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
