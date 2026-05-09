; DESCRIPTION: Places a orange circle of radius 70 at center (296, 136).
; PLAN: r0=296(x), r1=136(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 136
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
