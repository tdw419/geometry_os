; DESCRIPTION: Places a cyan dot at position (105, 91).
; PLAN: r0=105(x), r1=91(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 91
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
