; DESCRIPTION: Renders a red disk with center (278, 96) and radius 13.
; PLAN: r0=278(x), r1=96(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 96
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
