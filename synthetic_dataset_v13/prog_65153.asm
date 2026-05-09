; DESCRIPTION: Renders a purple disk with center (407, 126) and radius 27.
; PLAN: r0=407(x), r1=126(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 126
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
