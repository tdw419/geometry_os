; DESCRIPTION: Renders a red box of size 49x58 starting at (262, 133).
; PLAN: r0=262(x), r1=133(y), r2=49(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 133
LDI r2, 49
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
