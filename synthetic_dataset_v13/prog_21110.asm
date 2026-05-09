; DESCRIPTION: Places a purple dot at position (283, 42).
; PLAN: r0=283(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
