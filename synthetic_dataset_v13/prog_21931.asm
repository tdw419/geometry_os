; DESCRIPTION: Places a green dot at position (354, 253).
; PLAN: r0=354(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
