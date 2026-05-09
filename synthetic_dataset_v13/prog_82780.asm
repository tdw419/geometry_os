; DESCRIPTION: Places a magenta dot at position (202, 158).
; PLAN: r0=202(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 158
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
