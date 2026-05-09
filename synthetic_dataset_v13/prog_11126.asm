; DESCRIPTION: Places a green dot at position (365, 206).
; PLAN: r0=365(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
