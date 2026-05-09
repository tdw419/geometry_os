; DESCRIPTION: Renders a red box of size 91x67 starting at (288, 72).
; PLAN: r0=288(x), r1=72(y), r2=91(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 72
LDI r2, 91
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
