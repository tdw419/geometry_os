; DESCRIPTION: Places a cyan dot at position (376, 48).
; PLAN: r0=376(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
