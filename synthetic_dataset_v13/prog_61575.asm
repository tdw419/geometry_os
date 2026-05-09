; DESCRIPTION: Places a cyan dot at position (291, 131).
; PLAN: r0=291(x), r1=131(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 131
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
