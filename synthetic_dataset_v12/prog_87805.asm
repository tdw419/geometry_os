; DESCRIPTION: Places a green circle of radius 53 at center (217, 85).
; PLAN: r0=217(x), r1=85(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 85
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
