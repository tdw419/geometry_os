; DESCRIPTION: Places a magenta dot at position (266, 171).
; PLAN: r0=266(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
