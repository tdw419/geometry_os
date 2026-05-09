; DESCRIPTION: Renders a cyan disk with center (316, 141) and radius 66.
; PLAN: r0=316(x), r1=141(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 141
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
