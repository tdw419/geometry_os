; DESCRIPTION: Places a yellow dot at position (374, 158).
; PLAN: r0=374(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
