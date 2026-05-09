; DESCRIPTION: Places a white circle of radius 29 at center (473, 211).
; PLAN: r0=473(x), r1=211(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 211
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
