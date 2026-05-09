; DESCRIPTION: Composite: Creates a green circular shape at (309, 168) with radius 74 then Places a yellow dot at position (202, 204).
; PLAN: r0=309(x), r1=168(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 168
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
