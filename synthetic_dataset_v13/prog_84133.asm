; DESCRIPTION: Renders a red box of size 70x78 starting at (336, 157).
; PLAN: r0=336(x), r1=157(y), r2=70(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 157
LDI r2, 70
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
