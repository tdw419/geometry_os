; DESCRIPTION: Renders a red box of size 52x117 starting at (171, 123).
; PLAN: r0=171(x), r1=123(y), r2=52(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 123
LDI r2, 52
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
