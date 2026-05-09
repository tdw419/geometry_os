; DESCRIPTION: Renders a purple disk with center (176, 202) and radius 39.
; PLAN: r0=176(x), r1=202(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 202
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
