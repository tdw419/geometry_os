; DESCRIPTION: Renders a red box of size 62x73 starting at (111, 137).
; PLAN: r0=111(x), r1=137(y), r2=62(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 137
LDI r2, 62
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
