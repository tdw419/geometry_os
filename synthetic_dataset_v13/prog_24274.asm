; DESCRIPTION: Renders a red box of size 43x68 starting at (47, 141).
; PLAN: r0=47(x), r1=141(y), r2=43(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 141
LDI r2, 43
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
