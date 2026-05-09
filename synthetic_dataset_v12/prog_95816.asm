; DESCRIPTION: Places a yellow dot at position (383, 113).
; PLAN: r0=383(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 383
LDI r1, 113
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
