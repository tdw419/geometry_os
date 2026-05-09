; DESCRIPTION: Renders a magenta disk with center (383, 162) and radius 14.
; PLAN: r0=383(x), r1=162(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 162
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
