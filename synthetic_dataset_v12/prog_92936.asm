; DESCRIPTION: Renders a red box of size 41x33 starting at (412, 73).
; PLAN: r0=412(x), r1=73(y), r2=41(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 73
LDI r2, 41
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
