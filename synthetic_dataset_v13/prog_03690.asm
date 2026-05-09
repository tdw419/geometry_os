; DESCRIPTION: Renders a purple disk with center (262, 179) and radius 59.
; PLAN: r0=262(x), r1=179(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 179
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
