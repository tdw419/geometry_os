; DESCRIPTION: Places a purple dot at position (239, 192).
; PLAN: r0=239(x), r1=192(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 192
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
