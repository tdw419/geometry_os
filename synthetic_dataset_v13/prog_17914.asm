; DESCRIPTION: Places a cyan dot at position (164, 4).
; PLAN: r0=164(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
