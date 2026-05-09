; DESCRIPTION: Places a cyan dot at position (46, 82).
; PLAN: r0=46(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
