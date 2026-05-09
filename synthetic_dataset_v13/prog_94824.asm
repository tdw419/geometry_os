; DESCRIPTION: Places a white dot at position (237, 156).
; PLAN: r0=237(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
