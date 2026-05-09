; DESCRIPTION: Places a green dot at position (166, 209).
; PLAN: r0=166(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
