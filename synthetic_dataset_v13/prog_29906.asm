; DESCRIPTION: Places a cyan dot at position (7, 48).
; PLAN: r0=7(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
