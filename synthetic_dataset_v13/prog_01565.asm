; DESCRIPTION: Places a white circle of radius 50 at center (85, 74).
; PLAN: r0=85(x), r1=74(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 74
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
