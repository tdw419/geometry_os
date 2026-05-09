; DESCRIPTION: Renders a purple box of size 117x50 starting at (49, 101).
; PLAN: r0=49(x), r1=101(y), r2=117(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 101
LDI r2, 117
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
