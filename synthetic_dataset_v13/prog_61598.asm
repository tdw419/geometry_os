; DESCRIPTION: Places a cyan dot at position (395, 177).
; PLAN: r0=395(x), r1=177(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 177
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
