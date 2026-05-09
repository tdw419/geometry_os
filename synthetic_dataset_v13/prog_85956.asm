; DESCRIPTION: Places a green dot at position (322, 161).
; PLAN: r0=322(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
