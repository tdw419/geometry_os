; DESCRIPTION: Renders a red box of size 76x117 starting at (357, 130).
; PLAN: r0=357(x), r1=130(y), r2=76(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 130
LDI r2, 76
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
