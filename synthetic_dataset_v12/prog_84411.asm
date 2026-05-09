; DESCRIPTION: Renders a purple disk with center (150, 38) and radius 22.
; PLAN: r0=150(x), r1=38(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 38
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
