; DESCRIPTION: Renders a yellow disk with center (215, 74) and radius 29.
; PLAN: r0=215(x), r1=74(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 74
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
