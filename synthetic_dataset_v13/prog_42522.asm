; DESCRIPTION: Places a cyan dot at position (230, 6).
; PLAN: r0=230(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
