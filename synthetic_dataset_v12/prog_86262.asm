; DESCRIPTION: Places a white dot at position (335, 202).
; PLAN: r0=335(x), r1=202(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 202
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
