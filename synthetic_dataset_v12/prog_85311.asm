; DESCRIPTION: Renders a orange disk with center (303, 50) and radius 21.
; PLAN: r0=303(x), r1=50(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 50
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
