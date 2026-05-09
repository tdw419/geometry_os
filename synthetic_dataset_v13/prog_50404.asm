; DESCRIPTION: Places a red dot at position (296, 110).
; PLAN: r0=296(x), r1=110(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 110
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
