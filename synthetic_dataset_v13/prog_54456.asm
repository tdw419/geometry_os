; DESCRIPTION: Renders a red box of size 59x106 starting at (61, 49).
; PLAN: r0=61(x), r1=49(y), r2=59(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 49
LDI r2, 59
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
