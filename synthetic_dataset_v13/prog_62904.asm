; DESCRIPTION: Renders a red box of size 67x46 starting at (420, 148).
; PLAN: r0=420(x), r1=148(y), r2=67(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 148
LDI r2, 67
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
