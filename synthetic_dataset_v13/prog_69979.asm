; DESCRIPTION: Places a magenta dot at position (38, 143).
; PLAN: r0=38(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
