; DESCRIPTION: Renders a blue box of size 86x68 starting at (204, 135).
; PLAN: r0=204(x), r1=135(y), r2=86(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 135
LDI r2, 86
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
