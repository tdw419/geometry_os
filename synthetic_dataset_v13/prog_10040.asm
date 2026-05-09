; DESCRIPTION: Renders a orange disk with center (152, 144) and radius 64.
; PLAN: r0=152(x), r1=144(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 144
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
