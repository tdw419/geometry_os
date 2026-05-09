; DESCRIPTION: Places a white dot at position (368, 57).
; PLAN: r0=368(x), r1=57(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 57
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
