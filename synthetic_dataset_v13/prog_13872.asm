; DESCRIPTION: Places a magenta dot at position (127, 176).
; PLAN: r0=127(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
