; DESCRIPTION: Renders a white disk with center (431, 206) and radius 31.
; PLAN: r0=431(x), r1=206(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 206
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
