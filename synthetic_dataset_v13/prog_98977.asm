; DESCRIPTION: Renders a blue box of size 33x67 starting at (268, 153).
; PLAN: r0=268(x), r1=153(y), r2=33(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 153
LDI r2, 33
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
