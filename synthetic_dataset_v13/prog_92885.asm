; DESCRIPTION: Renders a blue disk with center (82, 47) and radius 24.
; PLAN: r0=82(x), r1=47(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 47
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
