; DESCRIPTION: Places a purple dot at position (479, 120).
; PLAN: r0=479(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
