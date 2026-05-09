; DESCRIPTION: Composite: Draws a white circle centered at (479, 227) with radius 27 then Places a yellow dot at position (259, 214).
; PLAN: r0=479(x), r1=227(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=214(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 479
LDI r1, 227
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 214
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
