; DESCRIPTION: Places a cyan dot at position (500, 49).
; PLAN: r0=500(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
