; DESCRIPTION: Places a white circle of radius 31 at center (196, 40).
; PLAN: r0=196(x), r1=40(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 40
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
