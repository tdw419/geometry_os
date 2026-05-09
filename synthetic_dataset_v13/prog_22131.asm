; DESCRIPTION: Renders a purple disk with center (281, 179) and radius 53.
; PLAN: r0=281(x), r1=179(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 179
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
