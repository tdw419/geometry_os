; DESCRIPTION: Places a magenta circle of radius 41 at center (74, 172).
; PLAN: r0=74(x), r1=172(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 172
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
