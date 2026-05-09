; DESCRIPTION: Renders a cyan disk with center (316, 126) and radius 17.
; PLAN: r0=316(x), r1=126(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 126
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
