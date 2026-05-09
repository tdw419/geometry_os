; DESCRIPTION: Renders a orange disk with center (296, 185) and radius 57.
; PLAN: r0=296(x), r1=185(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 185
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
