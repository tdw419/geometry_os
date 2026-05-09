; DESCRIPTION: Renders a orange disk with center (324, 160) and radius 80.
; PLAN: r0=324(x), r1=160(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 160
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
