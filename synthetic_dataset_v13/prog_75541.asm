; DESCRIPTION: Places a white circle of radius 68 at center (80, 181).
; PLAN: r0=80(x), r1=181(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 181
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
