; DESCRIPTION: Places a cyan dot at position (21, 149).
; PLAN: r0=21(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
