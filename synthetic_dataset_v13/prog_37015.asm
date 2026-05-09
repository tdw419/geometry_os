; DESCRIPTION: Places a yellow dot at position (453, 213).
; PLAN: r0=453(x), r1=213(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 213
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
