; DESCRIPTION: Places a cyan dot at position (10, 134).
; PLAN: r0=10(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
