; DESCRIPTION: Places a red dot at position (443, 135).
; PLAN: r0=443(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 443
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
