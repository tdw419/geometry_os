; DESCRIPTION: Places a white circle of radius 36 at center (329, 74).
; PLAN: r0=329(x), r1=74(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 74
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
