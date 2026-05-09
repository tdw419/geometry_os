; DESCRIPTION: Sets a single purple pixel at (507, 173).
; PLAN: r0=507(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
