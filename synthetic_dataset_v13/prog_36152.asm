; DESCRIPTION: Places a green dot at position (172, 92).
; PLAN: r0=172(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
