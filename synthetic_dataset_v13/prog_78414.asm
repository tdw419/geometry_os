; DESCRIPTION: Places a white dot at position (267, 128).
; PLAN: r0=267(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
