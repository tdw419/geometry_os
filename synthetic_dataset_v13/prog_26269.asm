; DESCRIPTION: Renders a red box of size 102x49 starting at (287, 172).
; PLAN: r0=287(x), r1=172(y), r2=102(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 172
LDI r2, 102
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
