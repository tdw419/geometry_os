; DESCRIPTION: Draws a cyan circle centered at (193, 119) with radius 41.
; PLAN: r0=193(x), r1=119(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 119
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
