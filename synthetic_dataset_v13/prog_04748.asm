; DESCRIPTION: Places a white dot at position (362, 182).
; PLAN: r0=362(x), r1=182(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 182
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
