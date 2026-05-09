; DESCRIPTION: Renders a purple box of size 68x106 starting at (297, 9).
; PLAN: r0=297(x), r1=9(y), r2=68(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 9
LDI r2, 68
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
