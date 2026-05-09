; DESCRIPTION: Places a green dot at position (332, 246).
; PLAN: r0=332(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
