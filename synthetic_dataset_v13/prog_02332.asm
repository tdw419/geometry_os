; DESCRIPTION: Creates a blue circular shape at (445, 66) with radius 34.
; PLAN: r0=445(x), r1=66(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 66
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
