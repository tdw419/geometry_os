; DESCRIPTION: Places a red dot at position (184, 218).
; PLAN: r0=184(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
