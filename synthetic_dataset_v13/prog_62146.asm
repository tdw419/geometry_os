; DESCRIPTION: Renders a red box of size 50x24 starting at (194, 59).
; PLAN: r0=194(x), r1=59(y), r2=50(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 59
LDI r2, 50
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
