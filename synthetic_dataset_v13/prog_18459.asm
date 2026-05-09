; DESCRIPTION: Places a magenta circle of radius 76 at center (188, 107).
; PLAN: r0=188(x), r1=107(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 107
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
