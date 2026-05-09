; DESCRIPTION: Places a cyan dot at position (375, 214).
; PLAN: r0=375(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 214
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
