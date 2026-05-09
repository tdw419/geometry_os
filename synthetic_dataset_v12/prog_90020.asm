; DESCRIPTION: Draws a cyan circle centered at (113, 144) with radius 41.
; PLAN: r0=113(x), r1=144(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 144
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
