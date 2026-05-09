; DESCRIPTION: Places a red dot at position (161, 50).
; PLAN: r0=161(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
