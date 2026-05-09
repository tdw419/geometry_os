; DESCRIPTION: Places a red dot at position (262, 75).
; PLAN: r0=262(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
