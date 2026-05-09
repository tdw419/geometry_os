; DESCRIPTION: Renders a red box of size 116x116 starting at (54, 36).
; PLAN: r0=54(x), r1=36(y), r2=116(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 36
LDI r2, 116
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
