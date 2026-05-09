; DESCRIPTION: Renders a purple disk with center (154, 173) and radius 15.
; PLAN: r0=154(x), r1=173(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 173
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
