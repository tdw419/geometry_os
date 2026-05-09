; DESCRIPTION: Sets a single black pixel at (487, 108).
; PLAN: r0=487(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
HALT
