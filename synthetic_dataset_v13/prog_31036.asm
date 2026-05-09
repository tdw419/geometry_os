; DESCRIPTION: Places a white dot at position (317, 226).
; PLAN: r0=317(x), r1=226(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 226
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
