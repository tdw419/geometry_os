; DESCRIPTION: Renders a red box of size 29x114 starting at (407, 94).
; PLAN: r0=407(x), r1=94(y), r2=29(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 94
LDI r2, 29
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
