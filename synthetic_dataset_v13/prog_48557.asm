; DESCRIPTION: Places a green dot at position (151, 254).
; PLAN: r0=151(x), r1=254(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 254
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
