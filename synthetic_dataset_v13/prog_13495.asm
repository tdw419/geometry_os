; DESCRIPTION: Renders a white disk with center (202, 181) and radius 32.
; PLAN: r0=202(x), r1=181(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 181
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
