; DESCRIPTION: Places a purple dot at position (256, 113).
; PLAN: r0=256(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
