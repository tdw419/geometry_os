; DESCRIPTION: Renders a red box of size 96x58 starting at (133, 158).
; PLAN: r0=133(x), r1=158(y), r2=96(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 158
LDI r2, 96
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
