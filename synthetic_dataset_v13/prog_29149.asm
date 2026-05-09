; DESCRIPTION: Renders a red box of size 95x12 starting at (194, 0).
; PLAN: r0=194(x), r1=0(y), r2=95(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 0
LDI r2, 95
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
