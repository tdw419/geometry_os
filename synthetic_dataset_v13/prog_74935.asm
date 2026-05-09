; DESCRIPTION: Places a white circle of radius 27 at center (250, 38).
; PLAN: r0=250(x), r1=38(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 38
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
