; DESCRIPTION: Places a yellow dot at position (83, 228).
; PLAN: r0=83(x), r1=228(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 228
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
