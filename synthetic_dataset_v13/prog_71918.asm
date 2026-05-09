; DESCRIPTION: Renders a purple disk with center (450, 54) and radius 48.
; PLAN: r0=450(x), r1=54(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 54
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
