; DESCRIPTION: Renders a blue disk with center (209, 173) and radius 75.
; PLAN: r0=209(x), r1=173(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 173
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
