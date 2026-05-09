; DESCRIPTION: Places a white circle of radius 19 at center (193, 36).
; PLAN: r0=193(x), r1=36(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 36
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
