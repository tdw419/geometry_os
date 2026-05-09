; DESCRIPTION: Renders a cyan disk with center (81, 106) and radius 53.
; PLAN: r0=81(x), r1=106(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 106
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
