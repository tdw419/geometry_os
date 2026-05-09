; DESCRIPTION: Places a green dot at position (288, 61).
; PLAN: r0=288(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 288
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
