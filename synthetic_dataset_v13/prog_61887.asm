; DESCRIPTION: Renders a purple disk with center (29, 228) and radius 11.
; PLAN: r0=29(x), r1=228(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 228
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
