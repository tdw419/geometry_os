; DESCRIPTION: Places a yellow dot at position (422, 248).
; PLAN: r0=422(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
