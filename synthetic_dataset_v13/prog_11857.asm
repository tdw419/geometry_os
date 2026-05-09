; DESCRIPTION: Renders a orange disk with center (363, 70) and radius 67.
; PLAN: r0=363(x), r1=70(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 70
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
