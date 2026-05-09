; DESCRIPTION: Places a cyan dot at position (165, 239).
; PLAN: r0=165(x), r1=239(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 239
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
