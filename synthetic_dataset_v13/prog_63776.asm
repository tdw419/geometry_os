; DESCRIPTION: Renders a cyan disk with center (165, 172) and radius 58.
; PLAN: r0=165(x), r1=172(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 172
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
