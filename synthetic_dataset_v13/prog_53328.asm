; DESCRIPTION: Places a cyan dot at position (30, 94).
; PLAN: r0=30(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
