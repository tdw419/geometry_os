; DESCRIPTION: Renders a red box of size 74x100 starting at (274, 153).
; PLAN: r0=274(x), r1=153(y), r2=74(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 153
LDI r2, 74
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
