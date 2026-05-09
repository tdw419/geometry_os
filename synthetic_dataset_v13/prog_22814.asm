; DESCRIPTION: Renders a white disk with center (350, 80) and radius 27.
; PLAN: r0=350(x), r1=80(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 80
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
