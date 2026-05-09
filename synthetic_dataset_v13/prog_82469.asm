; DESCRIPTION: Places a cyan dot at position (205, 159).
; PLAN: r0=205(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
