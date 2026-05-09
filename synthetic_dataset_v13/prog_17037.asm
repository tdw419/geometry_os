; DESCRIPTION: Places a cyan dot at position (349, 226).
; PLAN: r0=349(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
