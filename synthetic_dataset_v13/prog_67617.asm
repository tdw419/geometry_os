; DESCRIPTION: Draws a purple circle centered at (424, 129) with radius 41.
; PLAN: r0=424(x), r1=129(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 129
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
