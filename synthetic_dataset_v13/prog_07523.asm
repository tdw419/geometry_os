; DESCRIPTION: Renders a red box of size 112x36 starting at (102, 161).
; PLAN: r0=102(x), r1=161(y), r2=112(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 161
LDI r2, 112
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
