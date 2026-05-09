; DESCRIPTION: Renders a white disk with center (80, 107) and radius 61.
; PLAN: r0=80(x), r1=107(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 107
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
