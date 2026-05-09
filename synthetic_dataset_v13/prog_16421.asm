; DESCRIPTION: Places a green dot at position (239, 44).
; PLAN: r0=239(x), r1=44(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 44
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
