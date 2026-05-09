; DESCRIPTION: Places a cyan dot at position (363, 224).
; PLAN: r0=363(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
