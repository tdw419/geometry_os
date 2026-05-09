; DESCRIPTION: Renders a red box of size 70x52 starting at (135, 81).
; PLAN: r0=135(x), r1=81(y), r2=70(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 81
LDI r2, 70
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
