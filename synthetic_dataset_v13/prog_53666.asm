; DESCRIPTION: Places a white circle of radius 50 at center (71, 162).
; PLAN: r0=71(x), r1=162(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 162
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
