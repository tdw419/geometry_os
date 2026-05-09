; DESCRIPTION: Renders a red box of size 92x41 starting at (2, 73).
; PLAN: r0=2(x), r1=73(y), r2=92(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 73
LDI r2, 92
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
