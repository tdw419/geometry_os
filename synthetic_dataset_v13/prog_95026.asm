; DESCRIPTION: Places a cyan dot at position (424, 170).
; PLAN: r0=424(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
