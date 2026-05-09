; DESCRIPTION: Places a green dot at position (138, 120).
; PLAN: r0=138(x), r1=120(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 120
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
