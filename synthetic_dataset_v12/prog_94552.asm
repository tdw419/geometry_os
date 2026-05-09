; DESCRIPTION: Places a blue circle of radius 39 at center (281, 106).
; PLAN: r0=281(x), r1=106(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 106
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
