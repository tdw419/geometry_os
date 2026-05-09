; DESCRIPTION: Renders a green disk with center (203, 122) and radius 42.
; PLAN: r0=203(x), r1=122(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 122
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
