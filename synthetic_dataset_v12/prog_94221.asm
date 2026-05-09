; DESCRIPTION: Places a cyan dot at position (233, 180).
; PLAN: r0=233(x), r1=180(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 180
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
