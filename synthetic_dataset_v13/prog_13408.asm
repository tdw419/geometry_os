; DESCRIPTION: Renders a black disk with center (295, 164) and radius 34.
; PLAN: r0=295(x), r1=164(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 164
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
