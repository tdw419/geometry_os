; DESCRIPTION: Renders a red box of size 56x117 starting at (129, 5).
; PLAN: r0=129(x), r1=5(y), r2=56(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 5
LDI r2, 56
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
