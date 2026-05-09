; DESCRIPTION: Places a magenta circle of radius 75 at center (117, 164).
; PLAN: r0=117(x), r1=164(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 164
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
