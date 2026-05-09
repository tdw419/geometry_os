; DESCRIPTION: Renders a purple disk with center (239, 168) and radius 13.
; PLAN: r0=239(x), r1=168(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 168
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
