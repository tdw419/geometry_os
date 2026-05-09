; DESCRIPTION: Renders a purple box of size 85x25 starting at (336, 101).
; PLAN: r0=336(x), r1=101(y), r2=85(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 101
LDI r2, 85
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
