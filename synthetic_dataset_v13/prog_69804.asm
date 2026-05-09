; DESCRIPTION: Renders a red box of size 59x20 starting at (314, 25).
; PLAN: r0=314(x), r1=25(y), r2=59(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 25
LDI r2, 59
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
