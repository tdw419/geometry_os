; DESCRIPTION: Places a magenta dot at position (494, 12).
; PLAN: r0=494(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
