; DESCRIPTION: Renders a cyan disk with center (223, 66) and radius 25.
; PLAN: r0=223(x), r1=66(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 66
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
