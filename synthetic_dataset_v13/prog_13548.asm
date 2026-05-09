; DESCRIPTION: Renders a green box of size 78x36 starting at (67, 181).
; PLAN: r0=67(x), r1=181(y), r2=78(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 181
LDI r2, 78
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
