; DESCRIPTION: Renders a white disk with center (410, 152) and radius 47.
; PLAN: r0=410(x), r1=152(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 152
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
