; DESCRIPTION: Renders a yellow box of size 67x29 starting at (264, 1).
; PLAN: r0=264(x), r1=1(y), r2=67(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 1
LDI r2, 67
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
