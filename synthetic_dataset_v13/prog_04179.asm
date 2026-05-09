; DESCRIPTION: Renders a purple disk with center (42, 92) and radius 21.
; PLAN: r0=42(x), r1=92(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 92
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
