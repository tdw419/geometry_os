; DESCRIPTION: Renders a purple disk with center (228, 70) and radius 18.
; PLAN: r0=228(x), r1=70(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 70
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
