; DESCRIPTION: Places a cyan dot at position (33, 161).
; PLAN: r0=33(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
