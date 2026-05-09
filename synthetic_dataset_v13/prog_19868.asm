; DESCRIPTION: Renders a purple box of size 15x118 starting at (190, 16).
; PLAN: r0=190(x), r1=16(y), r2=15(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 16
LDI r2, 15
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
