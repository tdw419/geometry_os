; DESCRIPTION: Renders a orange disk with center (48, 206) and radius 26.
; PLAN: r0=48(x), r1=206(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 206
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
