; DESCRIPTION: Places a white circle of radius 18 at center (460, 188).
; PLAN: r0=460(x), r1=188(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 188
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
