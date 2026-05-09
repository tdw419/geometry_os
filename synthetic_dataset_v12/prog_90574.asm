; DESCRIPTION: Places a blue dot at position (349, 42).
; PLAN: r0=349(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
