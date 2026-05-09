; DESCRIPTION: Places a magenta circle of radius 41 at center (296, 97).
; PLAN: r0=296(x), r1=97(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 97
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
