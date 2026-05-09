; DESCRIPTION: Renders a purple box of size 55x35 starting at (216, 53).
; PLAN: r0=216(x), r1=53(y), r2=55(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 53
LDI r2, 55
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
