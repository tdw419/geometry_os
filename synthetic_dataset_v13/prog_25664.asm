; DESCRIPTION: Renders a red disk with center (263, 96) and radius 28.
; PLAN: r0=263(x), r1=96(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 96
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
