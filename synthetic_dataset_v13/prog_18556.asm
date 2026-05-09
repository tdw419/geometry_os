; DESCRIPTION: Renders a red box of size 32x100 starting at (357, 122).
; PLAN: r0=357(x), r1=122(y), r2=32(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 122
LDI r2, 32
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
