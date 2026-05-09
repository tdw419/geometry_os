; DESCRIPTION: Renders a purple disk with center (320, 178) and radius 68.
; PLAN: r0=320(x), r1=178(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 178
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
