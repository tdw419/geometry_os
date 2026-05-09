; DESCRIPTION: Places a magenta dot at position (327, 176).
; PLAN: r0=327(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
