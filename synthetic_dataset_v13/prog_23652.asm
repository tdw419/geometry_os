; DESCRIPTION: Sets a single green pixel at (274, 228).
; PLAN: r0=274(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 228
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
