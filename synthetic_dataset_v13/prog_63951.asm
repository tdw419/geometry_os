; DESCRIPTION: Places a magenta circle of radius 13 at center (213, 231).
; PLAN: r0=213(x), r1=231(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 231
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
