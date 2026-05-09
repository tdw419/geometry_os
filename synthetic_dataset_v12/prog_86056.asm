; DESCRIPTION: Renders a red box of size 80x88 starting at (394, 84).
; PLAN: r0=394(x), r1=84(y), r2=80(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 84
LDI r2, 80
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
