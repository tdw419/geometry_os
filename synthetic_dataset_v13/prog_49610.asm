; DESCRIPTION: Places a green dot at position (352, 177).
; PLAN: r0=352(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 177
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
