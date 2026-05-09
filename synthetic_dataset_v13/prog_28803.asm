; DESCRIPTION: Renders a yellow disk with center (173, 203) and radius 31.
; PLAN: r0=173(x), r1=203(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 203
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
