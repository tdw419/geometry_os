; DESCRIPTION: Places a red dot at position (309, 82).
; PLAN: r0=309(x), r1=82(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 309
LDI r1, 82
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
