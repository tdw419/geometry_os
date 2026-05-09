; DESCRIPTION: Places a white circle of radius 54 at center (74, 131).
; PLAN: r0=74(x), r1=131(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 131
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
