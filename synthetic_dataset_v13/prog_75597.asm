; DESCRIPTION: Renders a red box of size 43x76 starting at (25, 169).
; PLAN: r0=25(x), r1=169(y), r2=43(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 169
LDI r2, 43
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
