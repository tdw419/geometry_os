; DESCRIPTION: Places a green dot at position (305, 15).
; PLAN: r0=305(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
