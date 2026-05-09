; DESCRIPTION: Renders a red box of size 68x92 starting at (312, 15).
; PLAN: r0=312(x), r1=15(y), r2=68(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 15
LDI r2, 68
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
