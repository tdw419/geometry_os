; DESCRIPTION: Places a magenta circle of radius 70 at center (290, 85).
; PLAN: r0=290(x), r1=85(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 85
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
