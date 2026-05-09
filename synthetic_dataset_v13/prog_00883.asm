; DESCRIPTION: Places a magenta dot at position (352, 209).
; PLAN: r0=352(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
