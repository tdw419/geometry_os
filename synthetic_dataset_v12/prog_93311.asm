; DESCRIPTION: Places a yellow dot at position (73, 255).
; PLAN: r0=73(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
