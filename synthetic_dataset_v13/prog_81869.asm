; DESCRIPTION: Places a white circle of radius 52 at center (305, 99).
; PLAN: r0=305(x), r1=99(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 99
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
