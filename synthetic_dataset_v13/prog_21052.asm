; DESCRIPTION: Places a magenta dot at position (272, 246).
; PLAN: r0=272(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
