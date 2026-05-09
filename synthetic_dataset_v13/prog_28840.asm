; DESCRIPTION: Renders a red box of size 11x33 starting at (5, 129).
; PLAN: r0=5(x), r1=129(y), r2=11(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 129
LDI r2, 11
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
