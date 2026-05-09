; DESCRIPTION: Places a blue dot at position (193, 95).
; PLAN: r0=193(x), r1=95(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 95
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
