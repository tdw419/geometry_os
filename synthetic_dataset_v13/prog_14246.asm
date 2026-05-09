; DESCRIPTION: Places a blue dot at position (401, 30).
; PLAN: r0=401(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
