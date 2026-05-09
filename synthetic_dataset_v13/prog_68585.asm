; DESCRIPTION: Places a green dot at position (301, 55).
; PLAN: r0=301(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
