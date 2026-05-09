; DESCRIPTION: Renders a black box of size 67x110 starting at (313, 71).
; PLAN: r0=313(x), r1=71(y), r2=67(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 71
LDI r2, 67
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
