; DESCRIPTION: Renders a purple box of size 78x114 starting at (217, 3).
; PLAN: r0=217(x), r1=3(y), r2=78(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 3
LDI r2, 78
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
