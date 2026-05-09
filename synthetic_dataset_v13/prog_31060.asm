; DESCRIPTION: Renders a blue disk with center (126, 197) and radius 52.
; PLAN: r0=126(x), r1=197(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 197
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
