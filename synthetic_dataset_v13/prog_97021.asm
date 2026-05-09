; DESCRIPTION: Places a cyan dot at position (196, 76).
; PLAN: r0=196(x), r1=76(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 76
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
