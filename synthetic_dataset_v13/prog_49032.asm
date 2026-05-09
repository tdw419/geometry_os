; DESCRIPTION: Places a magenta dot at position (309, 134).
; PLAN: r0=309(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 309
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
