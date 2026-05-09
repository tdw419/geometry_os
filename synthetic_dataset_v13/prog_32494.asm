; DESCRIPTION: Places a magenta dot at position (356, 190).
; PLAN: r0=356(x), r1=190(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 190
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
