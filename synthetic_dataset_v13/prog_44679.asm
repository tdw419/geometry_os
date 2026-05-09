; DESCRIPTION: Places a yellow dot at position (298, 14).
; PLAN: r0=298(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
