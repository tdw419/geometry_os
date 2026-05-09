; DESCRIPTION: Renders a red box of size 11x107 starting at (172, 100).
; PLAN: r0=172(x), r1=100(y), r2=11(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 100
LDI r2, 11
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
