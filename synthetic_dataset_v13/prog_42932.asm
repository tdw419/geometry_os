; DESCRIPTION: Renders a orange disk with center (61, 131) and radius 32.
; PLAN: r0=61(x), r1=131(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 131
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
