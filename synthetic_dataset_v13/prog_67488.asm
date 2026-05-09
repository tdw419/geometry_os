; DESCRIPTION: Places a cyan dot at position (504, 90).
; PLAN: r0=504(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
