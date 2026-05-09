; DESCRIPTION: Renders a green box of size 67x88 starting at (325, 28).
; PLAN: r0=325(x), r1=28(y), r2=67(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 28
LDI r2, 67
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
