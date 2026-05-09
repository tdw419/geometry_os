; DESCRIPTION: Renders a red disk with center (382, 236) and radius 14.
; PLAN: r0=382(x), r1=236(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 236
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
