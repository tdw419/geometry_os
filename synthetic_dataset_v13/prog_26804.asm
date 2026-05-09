; DESCRIPTION: Renders a white disk with center (424, 150) and radius 58.
; PLAN: r0=424(x), r1=150(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 150
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
