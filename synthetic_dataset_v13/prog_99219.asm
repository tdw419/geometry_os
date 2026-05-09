; DESCRIPTION: Places a white circle of radius 37 at center (271, 89).
; PLAN: r0=271(x), r1=89(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 89
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
