; DESCRIPTION: Places a cyan dot at position (341, 67).
; PLAN: r0=341(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
