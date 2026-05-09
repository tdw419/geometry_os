; DESCRIPTION: Renders a blue box of size 111x67 starting at (324, 87).
; PLAN: r0=324(x), r1=87(y), r2=111(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 87
LDI r2, 111
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
