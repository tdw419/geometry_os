; DESCRIPTION: Places a yellow dot at position (505, 255).
; PLAN: r0=505(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
