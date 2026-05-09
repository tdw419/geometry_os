; DESCRIPTION: Places a green dot at position (214, 83).
; PLAN: r0=214(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
