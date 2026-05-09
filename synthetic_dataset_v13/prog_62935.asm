; DESCRIPTION: Renders a green box of size 114x46 starting at (389, 67).
; PLAN: r0=389(x), r1=67(y), r2=114(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 67
LDI r2, 114
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
