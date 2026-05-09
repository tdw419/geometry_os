; DESCRIPTION: Renders a orange disk with center (263, 92) and radius 60.
; PLAN: r0=263(x), r1=92(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 92
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
