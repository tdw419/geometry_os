; DESCRIPTION: Renders a blue disk with center (353, 228) and radius 19.
; PLAN: r0=353(x), r1=228(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 228
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
