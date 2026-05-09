; DESCRIPTION: Renders a purple disk with center (277, 168) and radius 37.
; PLAN: r0=277(x), r1=168(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 168
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
