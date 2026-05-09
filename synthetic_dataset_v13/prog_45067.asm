; DESCRIPTION: Renders a purple box of size 66x74 starting at (89, 165).
; PLAN: r0=89(x), r1=165(y), r2=66(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 165
LDI r2, 66
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
