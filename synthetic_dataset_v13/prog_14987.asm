; DESCRIPTION: Places a green dot at position (380, 134).
; PLAN: r0=380(x), r1=134(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 134
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
