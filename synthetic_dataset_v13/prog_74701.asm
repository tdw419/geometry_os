; DESCRIPTION: Places a white circle of radius 74 at center (229, 162).
; PLAN: r0=229(x), r1=162(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 162
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
