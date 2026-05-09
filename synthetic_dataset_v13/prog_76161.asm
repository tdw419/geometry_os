; DESCRIPTION: Renders a white disk with center (116, 162) and radius 70.
; PLAN: r0=116(x), r1=162(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 162
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
