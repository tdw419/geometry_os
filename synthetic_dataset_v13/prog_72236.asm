; DESCRIPTION: Renders a red box of size 86x102 starting at (312, 61).
; PLAN: r0=312(x), r1=61(y), r2=86(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 61
LDI r2, 86
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
