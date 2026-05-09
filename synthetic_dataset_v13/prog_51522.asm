; DESCRIPTION: Renders a purple disk with center (280, 150) and radius 57.
; PLAN: r0=280(x), r1=150(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 150
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
