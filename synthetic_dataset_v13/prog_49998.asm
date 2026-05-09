; DESCRIPTION: Places a cyan dot at position (17, 115).
; PLAN: r0=17(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
