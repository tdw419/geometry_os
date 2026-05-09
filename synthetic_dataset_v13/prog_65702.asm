; DESCRIPTION: Renders a orange disk with center (210, 146) and radius 62.
; PLAN: r0=210(x), r1=146(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 146
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
