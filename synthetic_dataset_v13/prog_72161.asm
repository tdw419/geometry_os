; DESCRIPTION: Renders a purple box of size 104x114 starting at (399, 93).
; PLAN: r0=399(x), r1=93(y), r2=104(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 93
LDI r2, 104
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
