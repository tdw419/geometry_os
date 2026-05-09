; DESCRIPTION: Places a magenta circle of radius 36 at center (117, 168).
; PLAN: r0=117(x), r1=168(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 168
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
