; DESCRIPTION: Renders a red box of size 68x25 starting at (181, 122).
; PLAN: r0=181(x), r1=122(y), r2=68(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 122
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
