; DESCRIPTION: Renders a purple box of size 67x102 starting at (318, 148).
; PLAN: r0=318(x), r1=148(y), r2=67(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 148
LDI r2, 67
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
