; DESCRIPTION: Renders a cyan disk with center (133, 83) and radius 79.
; PLAN: r0=133(x), r1=83(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 83
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
