; DESCRIPTION: Places a yellow dot at position (415, 220).
; PLAN: r0=415(x), r1=220(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 415
LDI r1, 220
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
