; DESCRIPTION: Renders a red box of size 49x88 starting at (368, 113).
; PLAN: r0=368(x), r1=113(y), r2=49(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 113
LDI r2, 49
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
