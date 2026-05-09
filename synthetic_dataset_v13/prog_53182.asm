; DESCRIPTION: Renders a purple disk with center (277, 130) and radius 42.
; PLAN: r0=277(x), r1=130(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 130
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
