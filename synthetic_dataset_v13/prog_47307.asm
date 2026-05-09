; DESCRIPTION: Renders a purple box of size 70x98 starting at (376, 67).
; PLAN: r0=376(x), r1=67(y), r2=70(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 67
LDI r2, 70
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
