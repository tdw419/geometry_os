; DESCRIPTION: Places a white circle of radius 39 at center (308, 46).
; PLAN: r0=308(x), r1=46(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 46
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
