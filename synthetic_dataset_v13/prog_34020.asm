; DESCRIPTION: Places a cyan dot at position (282, 79).
; PLAN: r0=282(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
