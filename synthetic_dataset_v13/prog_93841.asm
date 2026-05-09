; DESCRIPTION: Renders a red box of size 71x102 starting at (96, 54).
; PLAN: r0=96(x), r1=54(y), r2=71(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 54
LDI r2, 71
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
