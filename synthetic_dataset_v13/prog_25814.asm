; DESCRIPTION: Renders a red disk with center (385, 188) and radius 57.
; PLAN: r0=385(x), r1=188(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 188
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
