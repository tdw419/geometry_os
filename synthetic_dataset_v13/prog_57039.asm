; DESCRIPTION: Renders a orange disk with center (384, 131) and radius 59.
; PLAN: r0=384(x), r1=131(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 131
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
