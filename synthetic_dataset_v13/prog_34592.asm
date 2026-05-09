; DESCRIPTION: Renders a black disk with center (263, 127) and radius 48.
; PLAN: r0=263(x), r1=127(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 127
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
