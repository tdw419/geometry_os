; DESCRIPTION: Renders a purple box of size 118x14 starting at (189, 19).
; PLAN: r0=189(x), r1=19(y), r2=118(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 19
LDI r2, 118
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
