; DESCRIPTION: Renders a cyan disk with center (411, 135) and radius 53.
; PLAN: r0=411(x), r1=135(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 135
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
