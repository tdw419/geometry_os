; DESCRIPTION: Renders a red box of size 45x112 starting at (38, 95).
; PLAN: r0=38(x), r1=95(y), r2=45(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 95
LDI r2, 45
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
