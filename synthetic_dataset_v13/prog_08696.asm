; DESCRIPTION: Renders a purple box of size 67x82 starting at (332, 123).
; PLAN: r0=332(x), r1=123(y), r2=67(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 123
LDI r2, 67
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
