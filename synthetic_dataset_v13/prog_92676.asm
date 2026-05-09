; DESCRIPTION: Places a yellow dot at position (237, 175).
; PLAN: r0=237(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
