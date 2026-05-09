; DESCRIPTION: Renders a red box of size 76x49 starting at (133, 37).
; PLAN: r0=133(x), r1=37(y), r2=76(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 37
LDI r2, 76
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
