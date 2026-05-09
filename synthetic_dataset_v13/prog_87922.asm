; DESCRIPTION: Renders a purple box of size 34x36 starting at (475, 67).
; PLAN: r0=475(x), r1=67(y), r2=34(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 67
LDI r2, 34
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
