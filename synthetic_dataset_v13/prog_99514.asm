; DESCRIPTION: Places a green dot at position (460, 83).
; PLAN: r0=460(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
