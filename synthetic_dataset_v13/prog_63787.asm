; DESCRIPTION: Places a white circle of radius 20 at center (424, 167).
; PLAN: r0=424(x), r1=167(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 167
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
