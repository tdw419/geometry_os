; DESCRIPTION: Renders a orange disk with center (303, 173) and radius 80.
; PLAN: r0=303(x), r1=173(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 173
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
