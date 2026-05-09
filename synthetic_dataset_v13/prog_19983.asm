; DESCRIPTION: Sets a single red pixel at (156, 113).
; PLAN: r0=156(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
