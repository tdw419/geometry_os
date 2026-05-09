; DESCRIPTION: Renders a cyan disk with center (70, 105) and radius 34.
; PLAN: r0=70(x), r1=105(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 105
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
