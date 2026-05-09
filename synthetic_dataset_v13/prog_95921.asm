; DESCRIPTION: Renders a purple disk with center (284, 53) and radius 19.
; PLAN: r0=284(x), r1=53(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 53
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
