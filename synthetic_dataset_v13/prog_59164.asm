; DESCRIPTION: Places a cyan dot at position (357, 241).
; PLAN: r0=357(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
