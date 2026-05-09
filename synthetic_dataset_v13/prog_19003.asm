; DESCRIPTION: Renders a red disk with center (416, 80) and radius 15.
; PLAN: r0=416(x), r1=80(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 80
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
