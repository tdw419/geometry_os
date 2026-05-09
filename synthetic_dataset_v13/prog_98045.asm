; DESCRIPTION: Places a yellow dot at position (446, 189).
; PLAN: r0=446(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
