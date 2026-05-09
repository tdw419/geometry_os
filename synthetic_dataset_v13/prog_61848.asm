; DESCRIPTION: Places a white circle of radius 21 at center (220, 217).
; PLAN: r0=220(x), r1=217(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 217
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
