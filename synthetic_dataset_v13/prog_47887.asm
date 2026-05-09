; DESCRIPTION: Renders a red box of size 59x81 starting at (227, 117).
; PLAN: r0=227(x), r1=117(y), r2=59(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 117
LDI r2, 59
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
