; DESCRIPTION: Renders a white disk with center (281, 70) and radius 55.
; PLAN: r0=281(x), r1=70(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 70
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
