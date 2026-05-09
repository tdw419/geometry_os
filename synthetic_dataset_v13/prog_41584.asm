; DESCRIPTION: Renders a blue disk with center (116, 79) and radius 55.
; PLAN: r0=116(x), r1=79(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 79
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
