; DESCRIPTION: Renders a orange disk with center (210, 64) and radius 38.
; PLAN: r0=210(x), r1=64(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 64
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
