; DESCRIPTION: Renders a red box of size 91x48 starting at (357, 67).
; PLAN: r0=357(x), r1=67(y), r2=91(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 67
LDI r2, 91
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
