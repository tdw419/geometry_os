; DESCRIPTION: Places a green dot at position (10, 209).
; PLAN: r0=10(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
