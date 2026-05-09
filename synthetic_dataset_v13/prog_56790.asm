; DESCRIPTION: Places a white circle of radius 74 at center (197, 89).
; PLAN: r0=197(x), r1=89(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 89
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
