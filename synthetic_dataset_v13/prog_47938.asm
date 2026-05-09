; DESCRIPTION: Renders a magenta disk with center (162, 221) and radius 25.
; PLAN: r0=162(x), r1=221(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 221
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
