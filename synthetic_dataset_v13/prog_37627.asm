; DESCRIPTION: Renders a cyan disk with center (148, 174) and radius 74.
; PLAN: r0=148(x), r1=174(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 174
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
