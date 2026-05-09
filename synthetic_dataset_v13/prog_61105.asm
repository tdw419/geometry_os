; DESCRIPTION: Renders a white disk with center (279, 77) and radius 64.
; PLAN: r0=279(x), r1=77(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 77
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
