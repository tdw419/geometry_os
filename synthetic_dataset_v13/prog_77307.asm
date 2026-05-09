; DESCRIPTION: Places a red dot at position (263, 204).
; PLAN: r0=263(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
