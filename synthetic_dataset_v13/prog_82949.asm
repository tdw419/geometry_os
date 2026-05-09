; DESCRIPTION: Renders a white disk with center (301, 141) and radius 22.
; PLAN: r0=301(x), r1=141(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 141
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
