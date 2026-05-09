; DESCRIPTION: Sets a single green pixel at (454, 228).
; PLAN: r0=454(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 228
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
