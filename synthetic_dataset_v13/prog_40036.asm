; DESCRIPTION: Places a cyan dot at position (487, 19).
; PLAN: r0=487(x), r1=19(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 19
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
