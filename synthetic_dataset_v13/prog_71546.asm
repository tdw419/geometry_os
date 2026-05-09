; DESCRIPTION: Places a purple dot at position (502, 47).
; PLAN: r0=502(x), r1=47(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 47
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
