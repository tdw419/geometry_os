; DESCRIPTION: Renders a white disk with center (277, 214) and radius 19.
; PLAN: r0=277(x), r1=214(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 214
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
