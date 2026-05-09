; DESCRIPTION: Places a red dot at position (136, 113).
; PLAN: r0=136(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
