; DESCRIPTION: Places a cyan dot at position (384, 176).
; PLAN: r0=384(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
