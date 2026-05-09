; DESCRIPTION: Renders a cyan disk with center (165, 200) and radius 53.
; PLAN: r0=165(x), r1=200(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 200
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
