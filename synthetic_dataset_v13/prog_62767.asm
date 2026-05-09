; DESCRIPTION: Sets a single yellow pixel at (434, 208).
; PLAN: r0=434(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
