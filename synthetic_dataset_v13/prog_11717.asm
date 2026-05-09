; DESCRIPTION: Renders a red disk with center (454, 152) and radius 52.
; PLAN: r0=454(x), r1=152(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 152
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
