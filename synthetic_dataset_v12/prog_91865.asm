; DESCRIPTION: Renders a purple disk with center (300, 168) and radius 38.
; PLAN: r0=300(x), r1=168(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 168
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
