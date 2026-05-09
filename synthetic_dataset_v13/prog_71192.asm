; DESCRIPTION: Renders a cyan disk with center (124, 159) and radius 48.
; PLAN: r0=124(x), r1=159(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 159
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
