; DESCRIPTION: Places a cyan dot at position (462, 100).
; PLAN: r0=462(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 462
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
