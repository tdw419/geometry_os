; DESCRIPTION: Places a magenta circle of radius 60 at center (74, 174).
; PLAN: r0=74(x), r1=174(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 174
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
