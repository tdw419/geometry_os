; DESCRIPTION: Renders a purple disk with center (247, 194) and radius 21.
; PLAN: r0=247(x), r1=194(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 194
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
