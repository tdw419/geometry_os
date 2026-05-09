; DESCRIPTION: Places a magenta dot at position (321, 107).
; PLAN: r0=321(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
