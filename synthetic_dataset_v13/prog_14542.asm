; DESCRIPTION: Places a magenta dot at position (72, 177).
; PLAN: r0=72(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
