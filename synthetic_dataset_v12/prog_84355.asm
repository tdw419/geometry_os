; DESCRIPTION: Places a cyan dot at position (251, 134).
; PLAN: r0=251(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
