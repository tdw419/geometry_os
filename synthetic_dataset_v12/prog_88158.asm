; DESCRIPTION: Renders a yellow disk with center (126, 87) and radius 43.
; PLAN: r0=126(x), r1=87(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 87
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
