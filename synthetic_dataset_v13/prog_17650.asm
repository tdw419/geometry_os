; DESCRIPTION: Places a magenta circle of radius 15 at center (432, 146).
; PLAN: r0=432(x), r1=146(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 146
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
