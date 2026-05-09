; DESCRIPTION: Renders a purple box of size 81x53 starting at (80, 129).
; PLAN: r0=80(x), r1=129(y), r2=81(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 129
LDI r2, 81
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
