; DESCRIPTION: Renders a orange disk with center (277, 110) and radius 64.
; PLAN: r0=277(x), r1=110(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 110
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
