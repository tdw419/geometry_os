; DESCRIPTION: Renders a purple disk with center (264, 194) and radius 27.
; PLAN: r0=264(x), r1=194(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 194
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
