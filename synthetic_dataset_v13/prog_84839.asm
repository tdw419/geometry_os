; DESCRIPTION: Renders a red disk with center (474, 90) and radius 20.
; PLAN: r0=474(x), r1=90(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 90
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
