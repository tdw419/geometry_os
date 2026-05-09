; DESCRIPTION: Places a green dot at position (228, 119).
; PLAN: r0=228(x), r1=119(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 119
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
