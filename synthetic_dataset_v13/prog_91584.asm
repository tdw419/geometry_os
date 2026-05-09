; DESCRIPTION: Places a cyan dot at position (167, 132).
; PLAN: r0=167(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
