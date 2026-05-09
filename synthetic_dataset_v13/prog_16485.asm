; DESCRIPTION: Composite: Places a cyan dot at position (463, 51) then Creates a red circular shape at (100, 61) with radius 57.
; PLAN: r0=463(x), r1=51(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=61(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 463
LDI r1, 51
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 61
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
