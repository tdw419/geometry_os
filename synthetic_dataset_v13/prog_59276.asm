; DESCRIPTION: Places a cyan dot at position (167, 71).
; PLAN: r0=167(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
