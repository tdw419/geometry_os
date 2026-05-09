; DESCRIPTION: Places a white dot at position (365, 228).
; PLAN: r0=365(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
