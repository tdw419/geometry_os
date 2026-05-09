; DESCRIPTION: Renders a magenta disk with center (116, 162) and radius 16.
; PLAN: r0=116(x), r1=162(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 162
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
