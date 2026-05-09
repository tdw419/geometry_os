; DESCRIPTION: Renders a purple box of size 11x20 starting at (34, 179).
; PLAN: r0=34(x), r1=179(y), r2=11(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 179
LDI r2, 11
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
