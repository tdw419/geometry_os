; DESCRIPTION: Renders a cyan disk with center (266, 121) and radius 79.
; PLAN: r0=266(x), r1=121(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 121
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
