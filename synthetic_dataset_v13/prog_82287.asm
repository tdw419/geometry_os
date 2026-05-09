; DESCRIPTION: Renders a red disk with center (135, 144) and radius 66.
; PLAN: r0=135(x), r1=144(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 144
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
