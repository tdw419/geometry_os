; DESCRIPTION: Places a magenta dot at position (150, 82).
; PLAN: r0=150(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 82
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
