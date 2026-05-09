; DESCRIPTION: Renders a cyan disk with center (316, 54) and radius 35.
; PLAN: r0=316(x), r1=54(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 54
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
