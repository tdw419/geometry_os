; DESCRIPTION: Renders a red box of size 73x43 starting at (38, 150).
; PLAN: r0=38(x), r1=150(y), r2=73(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 150
LDI r2, 73
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
