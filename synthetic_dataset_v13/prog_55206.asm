; DESCRIPTION: Places a white circle of radius 27 at center (155, 86).
; PLAN: r0=155(x), r1=86(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 86
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
