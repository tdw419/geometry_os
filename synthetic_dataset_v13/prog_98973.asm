; DESCRIPTION: Places a magenta dot at position (113, 183).
; PLAN: r0=113(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
