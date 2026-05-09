; DESCRIPTION: Places a white circle of radius 20 at center (468, 193).
; PLAN: r0=468(x), r1=193(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 193
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
