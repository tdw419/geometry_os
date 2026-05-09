; DESCRIPTION: Renders a red box of size 98x88 starting at (202, 81).
; PLAN: r0=202(x), r1=81(y), r2=98(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 81
LDI r2, 98
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
