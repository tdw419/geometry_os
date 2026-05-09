; DESCRIPTION: Places a white dot at position (92, 27).
; PLAN: r0=92(x), r1=27(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 27
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
