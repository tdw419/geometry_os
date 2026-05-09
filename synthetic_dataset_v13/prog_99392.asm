; DESCRIPTION: Renders a orange disk with center (206, 118) and radius 32.
; PLAN: r0=206(x), r1=118(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 118
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
