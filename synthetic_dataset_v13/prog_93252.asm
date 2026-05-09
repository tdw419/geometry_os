; DESCRIPTION: Renders a cyan disk with center (165, 47) and radius 34.
; PLAN: r0=165(x), r1=47(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 47
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
