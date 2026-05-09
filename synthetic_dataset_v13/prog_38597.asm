; DESCRIPTION: Renders a red box of size 100x58 starting at (327, 170).
; PLAN: r0=327(x), r1=170(y), r2=100(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 170
LDI r2, 100
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
