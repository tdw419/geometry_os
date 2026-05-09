; DESCRIPTION: Places a magenta dot at position (262, 126).
; PLAN: r0=262(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
