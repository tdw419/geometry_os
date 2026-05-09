; DESCRIPTION: Renders a purple disk with center (367, 213) and radius 37.
; PLAN: r0=367(x), r1=213(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 213
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
