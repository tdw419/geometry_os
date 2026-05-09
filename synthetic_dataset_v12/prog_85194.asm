; DESCRIPTION: Places a magenta dot at position (126, 102).
; PLAN: r0=126(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
