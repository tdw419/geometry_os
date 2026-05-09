; DESCRIPTION: Renders a red box of size 101x99 starting at (92, 74).
; PLAN: r0=92(x), r1=74(y), r2=101(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 74
LDI r2, 101
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
