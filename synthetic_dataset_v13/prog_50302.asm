; DESCRIPTION: Places a magenta circle of radius 21 at center (243, 68).
; PLAN: r0=243(x), r1=68(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 68
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
