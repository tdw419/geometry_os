; DESCRIPTION: Renders a red box of size 61x36 starting at (93, 129).
; PLAN: r0=93(x), r1=129(y), r2=61(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 129
LDI r2, 61
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
