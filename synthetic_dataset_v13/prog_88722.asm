; DESCRIPTION: Places a cyan dot at position (130, 219).
; PLAN: r0=130(x), r1=219(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 219
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
