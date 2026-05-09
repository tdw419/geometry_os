; DESCRIPTION: Renders a purple disk with center (430, 206) and radius 21.
; PLAN: r0=430(x), r1=206(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 206
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
