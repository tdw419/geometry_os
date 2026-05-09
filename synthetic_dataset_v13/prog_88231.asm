; DESCRIPTION: Renders a purple box of size 66x20 starting at (217, 53).
; PLAN: r0=217(x), r1=53(y), r2=66(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 53
LDI r2, 66
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
