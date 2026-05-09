; DESCRIPTION: Places a white dot at position (52, 193).
; PLAN: r0=52(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
