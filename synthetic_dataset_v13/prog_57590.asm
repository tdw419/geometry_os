; DESCRIPTION: Places a red dot at position (198, 126).
; PLAN: r0=198(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
