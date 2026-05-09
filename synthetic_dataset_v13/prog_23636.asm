; DESCRIPTION: Places a cyan dot at position (338, 47).
; PLAN: r0=338(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 47
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
