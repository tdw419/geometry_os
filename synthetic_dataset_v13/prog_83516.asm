; DESCRIPTION: Renders a orange disk with center (373, 74) and radius 59.
; PLAN: r0=373(x), r1=74(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 74
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
