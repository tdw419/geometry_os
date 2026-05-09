; DESCRIPTION: Places a magenta dot at position (413, 229).
; PLAN: r0=413(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
