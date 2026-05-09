; DESCRIPTION: Composite: Sets a single white pixel at (257, 32) then Renders a cyan line between points (282, 77) and (131, 71).
; PLAN: r0=257(x), r1=32(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=77(y1), r7=131(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 32
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 77
LDI r7, 131
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
