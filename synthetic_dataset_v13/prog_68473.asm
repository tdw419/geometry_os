; DESCRIPTION: Composite: Creates a red circular shape at (343, 131) with radius 35 then Places a green dot at position (330, 81).
; PLAN: r0=343(x), r1=131(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 131
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
