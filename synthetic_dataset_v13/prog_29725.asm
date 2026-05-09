; DESCRIPTION: Renders a purple disk with center (444, 112) and radius 46.
; PLAN: r0=444(x), r1=112(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 112
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
