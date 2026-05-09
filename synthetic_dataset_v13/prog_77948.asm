; DESCRIPTION: Renders a red box of size 112x37 starting at (74, 162).
; PLAN: r0=74(x), r1=162(y), r2=112(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 162
LDI r2, 112
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
