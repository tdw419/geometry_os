; DESCRIPTION: Places a magenta dot at position (419, 209).
; PLAN: r0=419(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
