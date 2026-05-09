; DESCRIPTION: Places a white circle of radius 25 at center (464, 214).
; PLAN: r0=464(x), r1=214(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 214
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
