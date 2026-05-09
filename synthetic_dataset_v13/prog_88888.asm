; DESCRIPTION: Sets a single yellow pixel at (237, 125).
; PLAN: r0=237(x), r1=125(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 125
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
