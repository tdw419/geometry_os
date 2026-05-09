; DESCRIPTION: Places a white circle of radius 13 at center (216, 68).
; PLAN: r0=216(x), r1=68(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 68
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
