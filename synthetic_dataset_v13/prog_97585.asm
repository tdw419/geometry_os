; DESCRIPTION: Places a white circle of radius 48 at center (460, 203).
; PLAN: r0=460(x), r1=203(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 203
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
