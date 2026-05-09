; DESCRIPTION: Sets a single green pixel at (333, 134).
; PLAN: r0=333(x), r1=134(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 333
LDI r1, 134
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
