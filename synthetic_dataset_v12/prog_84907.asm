; DESCRIPTION: Renders a red box of size 67x43 starting at (440, 72).
; PLAN: r0=440(x), r1=72(y), r2=67(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 72
LDI r2, 67
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
