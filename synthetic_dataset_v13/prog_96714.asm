; DESCRIPTION: Renders a orange disk with center (207, 196) and radius 32.
; PLAN: r0=207(x), r1=196(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 196
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
