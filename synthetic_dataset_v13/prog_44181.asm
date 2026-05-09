; DESCRIPTION: Places a cyan dot at position (219, 68).
; PLAN: r0=219(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
