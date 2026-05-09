; DESCRIPTION: Places a cyan dot at position (418, 143).
; PLAN: r0=418(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
