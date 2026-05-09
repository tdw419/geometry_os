; DESCRIPTION: Places a green dot at position (368, 127).
; PLAN: r0=368(x), r1=127(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 127
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
