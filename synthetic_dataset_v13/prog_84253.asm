; DESCRIPTION: Sets a single black pixel at (474, 134).
; PLAN: r0=474(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 134
LDI r2, 0x000000
PSET r0, r1, r2
HALT
