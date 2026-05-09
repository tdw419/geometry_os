; DESCRIPTION: Renders a red box of size 78x92 starting at (292, 134).
; PLAN: r0=292(x), r1=134(y), r2=78(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 134
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
