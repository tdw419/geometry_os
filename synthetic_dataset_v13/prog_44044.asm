; DESCRIPTION: Places a magenta dot at position (274, 184).
; PLAN: r0=274(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
