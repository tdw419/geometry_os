; DESCRIPTION: Places a green dot at position (398, 81).
; PLAN: r0=398(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
