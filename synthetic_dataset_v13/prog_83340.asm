; DESCRIPTION: Places a green dot at position (450, 31).
; PLAN: r0=450(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 450
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
