; DESCRIPTION: Places a orange circle of radius 24 at center (460, 175).
; PLAN: r0=460(x), r1=175(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 175
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
