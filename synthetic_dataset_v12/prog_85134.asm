; DESCRIPTION: Places a white circle of radius 53 at center (85, 150).
; PLAN: r0=85(x), r1=150(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 150
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
