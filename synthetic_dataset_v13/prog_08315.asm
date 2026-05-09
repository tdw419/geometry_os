; DESCRIPTION: Sets a single blue pixel at (284, 107).
; PLAN: r0=284(x), r1=107(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 107
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
