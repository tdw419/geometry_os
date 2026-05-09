; DESCRIPTION: Places a cyan dot at position (322, 247).
; PLAN: r0=322(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
