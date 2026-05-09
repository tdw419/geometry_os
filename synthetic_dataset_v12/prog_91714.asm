; DESCRIPTION: Renders a yellow disk with center (320, 77) and radius 72.
; PLAN: r0=320(x), r1=77(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 77
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
