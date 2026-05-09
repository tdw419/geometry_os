; DESCRIPTION: Places a green dot at position (298, 35).
; PLAN: r0=298(x), r1=35(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 35
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
