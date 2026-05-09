; DESCRIPTION: Renders a red box of size 34x30 starting at (119, 63).
; PLAN: r0=119(x), r1=63(y), r2=34(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 63
LDI r2, 34
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
