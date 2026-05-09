; DESCRIPTION: Places a yellow dot at position (317, 171).
; PLAN: r0=317(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 171
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
