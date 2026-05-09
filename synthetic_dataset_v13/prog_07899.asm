; DESCRIPTION: Renders a purple disk with center (313, 111) and radius 63.
; PLAN: r0=313(x), r1=111(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 111
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
