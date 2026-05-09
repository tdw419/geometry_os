; DESCRIPTION: Places a magenta dot at position (77, 186).
; PLAN: r0=77(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
