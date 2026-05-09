; DESCRIPTION: Renders a purple disk with center (486, 213) and radius 25.
; PLAN: r0=486(x), r1=213(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 213
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
