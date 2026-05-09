; DESCRIPTION: Renders a orange disk with center (160, 168) and radius 12.
; PLAN: r0=160(x), r1=168(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 168
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
