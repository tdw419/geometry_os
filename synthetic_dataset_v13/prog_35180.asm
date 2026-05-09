; DESCRIPTION: Renders a red box of size 81x67 starting at (147, 133).
; PLAN: r0=147(x), r1=133(y), r2=81(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 133
LDI r2, 81
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
