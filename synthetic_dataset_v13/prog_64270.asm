; DESCRIPTION: Renders a red disk with center (222, 79) and radius 74.
; PLAN: r0=222(x), r1=79(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 79
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
