; DESCRIPTION: Places a cyan dot at position (477, 133).
; PLAN: r0=477(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
