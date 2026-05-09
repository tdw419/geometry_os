; DESCRIPTION: Places a green dot at position (12, 215).
; PLAN: r0=12(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
