; DESCRIPTION: Renders a cyan disk with center (134, 196) and radius 58.
; PLAN: r0=134(x), r1=196(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 196
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
