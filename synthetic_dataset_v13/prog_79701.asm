; DESCRIPTION: Places a cyan dot at position (336, 22).
; PLAN: r0=336(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
