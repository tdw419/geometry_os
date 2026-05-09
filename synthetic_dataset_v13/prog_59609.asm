; DESCRIPTION: Places a magenta dot at position (245, 37).
; PLAN: r0=245(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
