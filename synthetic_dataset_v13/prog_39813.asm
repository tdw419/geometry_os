; DESCRIPTION: Composite: Creates a red circular shape at (327, 176) with radius 62 then Places a red dot at position (184, 237).
; PLAN: r0=327(x), r1=176(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=237(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 176
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 237
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
