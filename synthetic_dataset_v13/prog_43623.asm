; DESCRIPTION: Places a purple dot at position (81, 228).
; PLAN: r0=81(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
