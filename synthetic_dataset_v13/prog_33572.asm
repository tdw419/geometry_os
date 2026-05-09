; DESCRIPTION: Renders a red box of size 58x72 starting at (452, 95).
; PLAN: r0=452(x), r1=95(y), r2=58(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 95
LDI r2, 58
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
