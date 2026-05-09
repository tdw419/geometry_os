; DESCRIPTION: Places a cyan dot at position (114, 167).
; PLAN: r0=114(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 167
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
