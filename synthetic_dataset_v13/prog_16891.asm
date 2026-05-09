; DESCRIPTION: Places a yellow dot at position (202, 237).
; PLAN: r0=202(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
