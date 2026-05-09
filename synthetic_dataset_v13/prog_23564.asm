; DESCRIPTION: Places a green dot at position (367, 182).
; PLAN: r0=367(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
