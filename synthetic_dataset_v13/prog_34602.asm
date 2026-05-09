; DESCRIPTION: Sets a single black pixel at (296, 244).
; PLAN: r0=296(x), r1=244(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 244
LDI r2, 0x000000
PSET r0, r1, r2
HALT
