; DESCRIPTION: Renders a orange disk with center (84, 173) and radius 31.
; PLAN: r0=84(x), r1=173(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 173
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
