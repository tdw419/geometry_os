; DESCRIPTION: Renders a white disk with center (229, 150) and radius 51.
; PLAN: r0=229(x), r1=150(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 150
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
