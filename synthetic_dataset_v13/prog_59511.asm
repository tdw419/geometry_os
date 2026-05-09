; DESCRIPTION: Renders a red box of size 57x92 starting at (93, 6).
; PLAN: r0=93(x), r1=6(y), r2=57(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 6
LDI r2, 57
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
