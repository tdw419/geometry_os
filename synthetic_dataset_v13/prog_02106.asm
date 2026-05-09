; DESCRIPTION: Places a blue dot at position (429, 215).
; PLAN: r0=429(x), r1=215(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 215
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
