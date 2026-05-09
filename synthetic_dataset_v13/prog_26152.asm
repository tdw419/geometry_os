; DESCRIPTION: Renders a orange disk with center (269, 121) and radius 57.
; PLAN: r0=269(x), r1=121(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 121
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
