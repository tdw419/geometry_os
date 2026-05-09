; DESCRIPTION: Places a red dot at position (328, 223).
; PLAN: r0=328(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
