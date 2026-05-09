; DESCRIPTION: Renders a black disk with center (428, 87) and radius 79.
; PLAN: r0=428(x), r1=87(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 87
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
