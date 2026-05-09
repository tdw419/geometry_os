; DESCRIPTION: Draws a cyan circle centered at (431, 87) with radius 41.
; PLAN: r0=431(x), r1=87(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 87
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
