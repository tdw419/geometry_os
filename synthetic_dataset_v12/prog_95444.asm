; DESCRIPTION: Renders a red disk with center (128, 70) and radius 30.
; PLAN: r0=128(x), r1=70(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 70
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
