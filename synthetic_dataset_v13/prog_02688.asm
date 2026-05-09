; DESCRIPTION: Places a red dot at position (220, 63).
; PLAN: r0=220(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
