; DESCRIPTION: Renders a red disk with center (110, 79) and radius 38.
; PLAN: r0=110(x), r1=79(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 79
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
