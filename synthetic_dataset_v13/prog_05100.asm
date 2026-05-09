; DESCRIPTION: Renders a purple disk with center (327, 173) and radius 60.
; PLAN: r0=327(x), r1=173(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 173
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
