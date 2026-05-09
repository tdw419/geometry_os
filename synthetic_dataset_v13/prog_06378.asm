; DESCRIPTION: Creates a blue circular shape at (188, 197) with radius 44.
; PLAN: r0=188(x), r1=197(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 197
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
