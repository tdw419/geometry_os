; DESCRIPTION: Places a cyan dot at position (368, 87).
; PLAN: r0=368(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
