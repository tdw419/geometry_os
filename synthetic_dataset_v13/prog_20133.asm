; DESCRIPTION: Renders a red box of size 16x95 starting at (133, 138).
; PLAN: r0=133(x), r1=138(y), r2=16(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 138
LDI r2, 16
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
