; DESCRIPTION: Places a cyan dot at position (408, 79).
; PLAN: r0=408(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 408
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
