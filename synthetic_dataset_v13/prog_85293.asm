; DESCRIPTION: Places a white circle of radius 20 at center (21, 155).
; PLAN: r0=21(x), r1=155(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 155
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
